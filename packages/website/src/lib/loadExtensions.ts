import { __dirname } from "../__dirname";
import { APIRoutes, SidebarLinks, Views } from "./Shared";
import { config, activate } from "@underflow/docs-loader";


export async function loadExtensions() {
	// An extension is just a node module
	if (config && config.views) {
		for (const view of config.views) {
			Views[view.id] = view
		}
	}

	if (config && config.links) {
		for (const link of config.links) {
			SidebarLinks[link.id] = link;
		}
	}

	if (config && config.api) {
		for (const route of config.api) {
			APIRoutes[route.id] = route;
		}
	}
	// Generate an id from the name in the extension config
	//const id = extension.toLowerCase().replace(/[^A-Za-z_\-0-9]/g, "_").replace(/[_]+/g, "_");
	//await module.activate(context);
}
