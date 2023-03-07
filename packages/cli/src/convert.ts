// Convert the content of a stackdump to an sqlite database
import {toJson} from "xml2json"
import * as path from "path"
import * as fs from "fs"
import * as cliProgress from "cli-progress";
import { MappedDatabase } from "./db-map.js";
import pkg from "pg"
const { Pool } = pkg;
import format from "pg-format";

const client = new Pool({
	database: "stack-exchange-offline",
	host: "localhost",
	password: "Lateman47,43,s54",
	user: "stack-exchange"
})

import { dirname } from 'path';
import { fileURLToPath } from 'url';

const __dirname = dirname(fileURLToPath(import.meta.url));

if (process.argv.length < 3) {
	console.log("Usage: node convert.js [CONTENT_DIRECTORY]");
	process.exit(1);
}

const contentDir = path.join(process.cwd(), process.argv[2]);

// Get all files in the content directory.
const files = fs.readdirSync(contentDir).map(x => path.join(contentDir, x));

// Check if the database has already been created.
if (fs.existsSync(path.join(__dirname, "db/main.db"))) {
	
} else {
	// Create the tables for stackoverflow.
	let expected = 0, inserted = 0, errors = 0;
	//await client.query("BEGIN");
	const sql = fs.readFileSync(path.join(__dirname, "../schema/full.sql"), "utf-8");
	//await client.query(sql);
	console.log("Created schema.")
	// Continue, all tables are created.
	// Loop through all entries and insert them based on their name.
	const statements = [];
	for (let i = 0; i < files.length; i++) {
		const file = files[i];
		const tableName = path.parse(file).name;
		const content = fs.readFileSync(file);
		const json = JSON.parse(toJson(content));
		
		// Insert all rows
		const rows = json[tableName.toLowerCase()]["row"];
		statements.push({
			table: tableName,
			rows: rows
		})
		expected += rows.length;
	}

	const bar = new cliProgress.SingleBar({}, cliProgress.Presets.shades_classic);
	bar.start(expected, inserted)
	for (const {rows, table} of statements) {
		console.log(table)
		insertRows(rows, table).then(async () => {
			inserted += rows.length;
			if (inserted % 50 == 0) {
				bar.update(inserted)
			}
			if (inserted == expected) {
				console.log("Finished!");
				bar.update(inserted);
				bar.stop();
				await client.query("SET session_replication_role = 'origin';");
				client.end();
			}
		})
	}
}


type Row = {
	[key: string]: any
}

async function insertRows(rows: Row[], table: string) {
	const requiredColumns = MappedDatabase[table].required.map(x => x.toLowerCase());
	const optionalColumns = MappedDatabase[table].optional.map(x => x.toLowerCase());
	const columns = requiredColumns.concat(optionalColumns);
	// Insert multiple rows at a time.
	const values = [];

	rowLoop: for (const row of rows) {
		let rowValues = [];
		const preValues = Object.values(row);
		const keys = Object.keys(row).map(x => x.toLowerCase());
		for (const column of requiredColumns) {
			let index = keys.indexOf(column);
			if (index == -1) {
				console.log(`Missing required field: ${table}.${column}`);
				continue rowLoop;
			}
			rowValues.push(preValues[index])
		}
		for (const column of optionalColumns) {
			let index = keys.indexOf(column);
			if (index == -1) {
				row[column] = null;
			}
			rowValues.push(preValues[index])
		}
		values.push(rowValues);
	}

	try {
		await client.query("SET session_replication_role = 'replica';");
		const query = format(`INSERT INTO ${table} (${columns.join(",")}) VALUES %L`, values);
		return await client.query(query);
	} catch(err: any) {
		console.log(err.message);
		console.log("Table: " + table);
		console.log("Columns: " + columns);
		console.log("Rows: " + values.length)
		console.log()
		return
	}
}