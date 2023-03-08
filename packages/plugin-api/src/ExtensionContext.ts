import * as path from "path";
import * as fs from "fs";
import { __dirname } from "./__dirname";
import { Sidebar } from "./Sidebar";
import { View } from "./View";

/// <reference path="index.ts" />
	export class ExtensionContext {
		public Sidebar: Sidebar;
		public View: View;

		public constructor(private id: string, views: any, sidebarLinks: any, config: any) {
			this.Sidebar = new Sidebar(sidebarLinks);
			this.View = new View(config, views);
		}

		public addToLockfile(property: string, value: any) {}

		public getStoragePath() {
			// Check if the path has already been created, otherwise we need to create the directory.
			const dir = path.join(__dirname, "./persistent", this.id);
			if (!fs.existsSync(dir)) {
				fs.mkdirSync(dir, { recursive: true });
			}

			return dir;
		}

		public store(
			file: string,
			content: string | NodeJS.ArrayBufferView,
			options?: fs.WriteFileOptions | undefined
		) {
			let filePath = path.join(this.getStoragePath(), file);
			fs.writeFileSync(filePath, content, options);
		}

		public get(file: string): string | null {
			let filePath = path.join(this.getStoragePath(), file);

			if (fs.existsSync(filePath)) {
				return fs.readFileSync(filePath, "utf-8");
			}

			return null;
		}
	}
