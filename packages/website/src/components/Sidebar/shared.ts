import { writable, Writable } from "svelte/store";
import type { ViewLinks } from "./types";
import { Home, Cube } from "../Icons/index";

export const ViewButtons: Writable<ViewLinks> = writable({
	"home": {
		icon: Home,
		link: "/",
		id: "home"
	},
	"docs": {
		icon: Cube,
		link: "/docs",
		id: "docs"
	}
})