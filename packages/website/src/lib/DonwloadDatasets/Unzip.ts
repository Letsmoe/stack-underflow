import Seven from "7zip-min";
import * as fs from "fs";
import * as path from "path"
import { __dirname } from "../../__dirname";
import { GetLockFile, WriteLockFile } from "../Lock";
import type { Download, LockFile } from "../Lock/types";
import { WebSocketClient } from "../Socket";

export async function UnzipDataset(download: Download): Promise<Download> {
	const socket = new WebSocketClient("ws://localhost:8080");
	
	return new Promise((resolve, reject) => {
		socket.on("open", async () => {
			socket.emit("dataset:download:start", { site: download.site })
			let target = path.join(__dirname, "../content/", download.site.safe_name)
			Seven.unpack(download.zip, target, (err) => {
				if (err) {
					socket.emit("dataset:download:error", { site: download.site, errors: [err.message] })
					fs.rmdirSync(target, { recursive: true })
					reject()
				}
		
				socket.emit("dataset:download:success", { site: download.site })
				const lockFile = GetLockFile()
				const index = lockFile.downloads.findIndex((x) => x.site.safe_name == download.site.safe_name)
				if (index > -1) {
					lockFile.downloads[index].status = "unzipped";
					lockFile.downloads[index].files = fs.readdirSync(target)
					WriteLockFile(lockFile as LockFile);
					fs.rmSync(download.zip);
					resolve(lockFile.downloads[index])
				}
			});
		})
	})
}