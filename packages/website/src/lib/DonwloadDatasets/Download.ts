import axios from "axios";
import * as fs from "fs";
import * as path from "path";
import { GetLockFile, WriteLockFile } from "../Lock";
import type { Download, LockFile } from "../Lock/types";
import { WebSocketClient } from "../Socket";
import type { Site } from "../types";
import { __dirname } from "../../__dirname";

export async function DownloadDataset(
	site: Site
): Promise<Download> {
	const socket = new WebSocketClient("ws://localhost:8080");
	const target = path.join(__dirname, "../content/zip/" + site.safe_name);

	if (!fs.existsSync(target)) {
		fs.mkdirSync(path.dirname(target), { recursive: true });
	}

	let sizeTotal: number = 0;
	return new Promise((resolve, reject) => {
		socket.on("open", async () => {
			// Create a writestream to pipe the file to
			const writeStream = fs.createWriteStream(target);
			// Emit a start event
			socket.emit("dataset:download:start", { site })
			axios.request({
				method: "get",
				url: "https://archive.org/download/stackexchange/" + site.dataset,
				onDownloadProgress: (progress) => {
					sizeTotal = progress.total || 0;
					// There might not be a content-length header on the resource we're trying to fetch.
					let percent = 0;
					if (progress.total) {
						percent = Math.round((progress.loaded * 100) / progress.total);
					}

					socket.emit("dataset:download:progress", { progress: percent, speed: progress.rate, eta: progress.estimated, site })
				},
				responseType: "stream"
			}).then(response => {
				response.data.pipe(writeStream);
				let error: Error;
				writeStream.on('error', (err: Error) => {
					socket.emit("dataset:download:error", { site, errors: [] })
					error = err;
					writeStream.close();
					reject(err);
				});
				writeStream.on('close', () => {
					// If no error occured, we can safely send a success event to the websocket and resolve true.
					if (!error) {
						socket.emit("dataset:download:success", { site })
						const lockFile = GetLockFile();
						let download: Download = {
							database: null,
							files: [],
							site,
							size: sizeTotal,
							status: "downloaded",
							timestamp: new Date().toISOString(),
							url: "https://archive.org/download/stackexchange/" + site.dataset,
							zip: target
						};
						lockFile?.downloads.push(download)
						WriteLockFile(lockFile as LockFile);
						resolve(download);
					}
				});
			})
		});
	});
}
