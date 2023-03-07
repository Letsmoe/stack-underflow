/**
 * @author Letsmoe
 * @email moritz.utcke@gmx.de
 * @create date 2023-03-04 00:14:00
 * @modify date 2023-03-04 00:14:00
 * @desc Since we don't want to hardcode every single dataset into our application, we will need some way of finding out about new
 * datasets. Here we use scraping to get all datasets and their respective sizes from https://archive.org/details/stackexchange
 * once we have those we can initiate downloads based on that information.
 */
import axios from "axios";
import {load} from "cheerio";
import * as path from "path"

export interface Dataset {
	size: number,
	url: string,
	name: string,
	installed: boolean
}

export async function getNewestDatasets() {
	const archiveOrgUrl = "https://archive.org/details/stackexchange";

	const result = await axios.get(archiveOrgUrl);
	const $ = load(result.data);

	// Initialize an array for out datasets to be stored in.
	const datasets: Dataset[] = [];
	const sizes = $("#quickdown1 .format-file .down-rite").toArray();
	const files = $("#quickdown1 .format-file a").toArray();

	for (let i = 0; i < sizes.length; i++) {
		// We need to parse the size, since it is in this format by default: xK -> Kilobyte, xM -> Megabyte, xG -> Gigabyte
		// We want to convert everything to byte.
		let size, url = "";
		if (sizes[i].children.length > 0) {
			size = sizes[i].children[0].data.trim();
			let sizeWithoutLetter = parseFloat(size.substring(0, size.length - 1));
			if (size.endsWith("K")) {
				size = sizeWithoutLetter * 1024
			} else if (size.endsWith("M")) {
				size = sizeWithoutLetter * 1024 ** 2
			} else if (size.endsWith("G")) {
				size = sizeWithoutLetter * 1024 ** 3
			}
		}
		if (files[i].attribs) {
			url = files[i].attribs["href"] || "";
		}

		let name = path.parse(url).name;

		datasets.push({
			size, url,
			name,
			installed: false
		})
	}
	return datasets;
}