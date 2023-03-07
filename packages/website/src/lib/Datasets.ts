import { __dirname } from "../__dirname";
import {
	UnzipDataset,
	DownloadDataset,
	InstallDataset,
} from "./DonwloadDatasets";
import { GetLockFile } from "./Lock";
import type { Site } from "./types";

export async function startDatasetDownload(site: Site) {
	// We need to get the filename from the dataset url, download the file into the "content" folder
	// and unzip it there
	DownloadDataset(site)
		.then((download) => {
			UnzipDataset(download).then((unzipped) => {
				InstallDataset(unzipped);
			});
		})
		.catch();
}

export function isAlreadyDownloaded(site: Site): boolean {
	const lockFile = GetLockFile();

	if (!lockFile) {
		return false;
	}

	return lockFile.downloads.find((download) => download.database == site.safe_name)
		? true
		: false;
}
