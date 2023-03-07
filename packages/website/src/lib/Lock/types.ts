import type { Site } from "../types";

export interface Plugin {
  // The name of the plugin
  name: string;

  // The version of the plugin
  version: string;

  // A brief description of the plugin
  description: string;

  // The URL where the plugin can be downloaded
  url: string;

  // An array of dependencies required by the plugin
  dependencies: {
    [dependencyName: string]: string;
  };
}


export interface Download {
  // The URL from which the zip file was downloaded
  url: string;

  // The site information where the dataset was pulled from
  site: Site,

  // An array of file names included in the zip file
  files: string[];

  // A timestamp indicating when the zip file was downloaded
  timestamp: string;

  // A string indicating the status of the zip file
  // Possible values are "downloaded", "unzipped", or "installed"
  status: "downloaded" | "unzipped" | "installed";

  // The size of the zip file in bytes
  size: number;

	// The name of the database associated with this download
	database: string | null

	// The path of the zip file if the zip has not already been unzipped
	zip: string
}

export interface LockFile {
  // An array of downloaded zip file objects
  downloads: Download[];

	// The version number of the used lock file.
	version: number;

	// An array of plugins that were installed
	plugins: Plugin[]
}
