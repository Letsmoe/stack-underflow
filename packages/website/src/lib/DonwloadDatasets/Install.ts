// Convert the content of a stackdump to an sqlite database
import { toJson } from "xml2json";
import * as path from "path";
import * as fs from "fs";
import { MappedDatabase } from "./db-map";
import pkg from "pg";
const { Pool } = pkg;
import format from "pg-format";
import { WebSocketClient } from "../Socket.js";
import { GetLockFile, WriteLockFile } from "../Lock";
import type { Download, LockFile } from "../Lock/types";
import { __dirname } from "../../__dirname";

type Row = {
	[key: string]: any;
};

async function insertRows(rows: Row[], table: string, client: pkg.Pool) {
	return new Promise(async (resolve, reject) => {
		const requiredColumns = MappedDatabase[table].required.map((x: string) =>
			x.toLowerCase()
		);
		const optionalColumns = MappedDatabase[table].optional.map((x: string) =>
			x.toLowerCase()
		);
		const columns = requiredColumns.concat(optionalColumns);
		// Insert multiple rows at a time.
		const values = [];

		rowLoop: for (const row of rows) {
			let rowValues = [];
			const preValues = Object.values(row);
			const keys = Object.keys(row).map((x) => x.toLowerCase());
			for (const column of requiredColumns) {
				let index = keys.indexOf(column);
				if (index == -1) {
					console.log(`Missing required field: ${table}.${column}`);
					continue rowLoop;
				}
				rowValues.push(preValues[index]);
			}
			for (const column of optionalColumns) {
				let index = keys.indexOf(column);
				if (index == -1) {
					row[column] = null;
				}
				rowValues.push(preValues[index]);
			}
			values.push(rowValues);
		}

		try {
			await client.query("SET session_replication_role = 'replica';");
			const query = format(
				`INSERT INTO ${table} (${columns.join(",")}) VALUES %L`,
				values
			);
			resolve(await client.query(query));
		} catch (err: any) {
			reject(err);
			return;
		}
	});
}

const transaction = async (callback: Function, client: pkg.Pool): Promise<boolean> => {
	try {
			await client.query('BEGIN');
			try {
					await callback(client);
					await client.query('COMMIT');
					return true;
			} catch (error: any) {
					await client.query('ROLLBACK');
					console.log(error)
					return false;
			}
	} catch(error: any) {
		return false;
	} finally {
			return true
	}
};

export async function InstallDataset(download: Download): Promise<Download> {
	var client = new Pool({
		host: "localhost",
		password: "Lateman47,43,s54",
		user: "stack-exchange",
	});
	const socket = new WebSocketClient("ws://localhost:8080");
	return new Promise((resolve, reject) => {
		socket.on("open", async () => {
			let dir = path.join(__dirname, "../content/", download.site.safe_name);
			const files = fs.readdirSync(dir).map((x) => path.join(dir, x));
			socket.emit("dataset:install:start", { site: download.site, files });
			let expected = 0,
				inserted = 0;
			
			// Create the database
			const dbName = `stack_underflow_${download.site.safe_name}`;
			try {
				await client.query(`CREATE DATABASE "${dbName}"
				WITH
				OWNER = "stack-exchange"
				ENCODING = 'UTF8'
				CONNECTION LIMIT = -1
				IS_TEMPLATE = False;`)
				client.end();
			} catch(error: any) {
				console.log(error, download)
				socket.emit("dataset:install:error", {
					site: download.site,
					files,
					errors: ["Failed to create database.", error],
				});
				return;
			}
	
			// We need to switch the client, since postgres does not allow switching databases in one session.
			client = new Pool({
				host: "localhost",
				password: "Lateman47,43,s54",
				user: "stack-exchange",
				database: dbName
			});
			const sql = fs.readFileSync(
				path.join(__dirname, "schema/db.sql"),
				"utf-8"
			);
			const tablesCreated = await transaction(async () => {
				await client.query(sql);
			}, client)
	
			if (!tablesCreated) {
				// Tables could not be created, something went wrong!
				socket.emit("dataset:install:error", {
					site: download.site,
					files,
					errors: ["Failed to create tables."],
				});
				return;
			}
	
			// Continue, all tables are created.
			// Loop through all entries and insert them based on their name.
			for (let i = 0; i < files.length; i++) {
				const file = files[i];
				const table = path.parse(file).name;
				const content = fs.readFileSync(file);
				const json = JSON.parse(toJson(content));
	
				// Insert all rows
				const rows = json[table.toLowerCase()]["row"];
				expected += rows.length;
				insertRows(rows, table, client)
					.then(async () => {
						inserted += rows.length;
						socket.emit("dataset:install:progress", {
							progress: Math.round((inserted / expected) * 100),
							site: download.site,
							files,
						});
						if (inserted == expected) {
							socket.emit("dataset:install:success", { site: download.site, files });
							const lockFile = GetLockFile()
							const index = lockFile.downloads.findIndex((x) => x.site.safe_name == download.site.safe_name)
							if (index > -1) {
								lockFile.downloads[index].status = "installed";
								lockFile.downloads[index].database = dbName;
							}
							WriteLockFile(lockFile as LockFile);
							await client.query("SET session_replication_role = 'origin';");
							client.end();
							// Remove the folder, everything is inside the database now.
							fs.rmdirSync(dir, { recursive: true });
							resolve(lockFile.downloads[index])
						}
					})
					.catch((err) => {
						socket.emit("dataset:install:error", {
							site: download.site,
							files,
							errors: [err.message],
						});
						reject()
					});
			}
		});
	})
}
