import * as path from "path";
import * as fs from "fs";
import { __dirname } from "../__dirname";

const filePath = path.join(__dirname, "persistent/bookmarks.json");

export interface Bookmark {
	timestamp: number,
	data: any,
	id: number
}

export type Bookmarks = {[id: number]: Bookmark}

export function addBookmark(id: number, data: any) {
	let bookmarks: Bookmarks = {};
	if (hasBookmarkFile()) {
		bookmarks = getBookmarks()
	}

	bookmarks[id] = {
		id,
		data,
		timestamp: (new Date()).getTime()
	}

	saveBookmarks(bookmarks);
}

export function saveBookmarks(bookmarks: Bookmarks) {
	if (!hasBookmarkFile()) {
		createBookmarkFile(bookmarks)
	} else {
		let content = JSON.stringify(bookmarks);
		fs.writeFileSync(filePath, content, "utf-8");
	}
}


export function createBookmarkFile(content: Bookmarks = {}) {
	if (!hasBookmarkFile()) {
		// Check if the directory exists.
		let folder = path.dirname(filePath);
		if (!fs.existsSync(folder)) {
			fs.mkdirSync(folder, { recursive: true })
		}

		fs.writeFileSync(filePath, JSON.stringify(content), "utf-8");
	}
}

export function removeBookmark(id: number) {
	const bookmarks = getBookmarks();

	if (id in bookmarks) {
		delete bookmarks[id];
	}

	saveBookmarks(bookmarks);
}

export function isBookmarked(id: number): boolean {
	if (!hasBookmarkFile()) {
		return false;
	}
	const bookmarks = getBookmarks();

	if (id in bookmarks) {
		return true;
	}

	return false;
}

export function hasBookmarkFile(): boolean {
	return fs.existsSync(filePath);
}

export function getBookmarks(): Bookmarks {
	if (!hasBookmarkFile()) {
		return {};
	}

	const content = fs.readFileSync(filePath, "utf-8");
	return JSON.parse(content);
}