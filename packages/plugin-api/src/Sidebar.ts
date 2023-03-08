import type { SvelteComponent } from "svelte";

/// <reference path="index.ts" />
	export class Sidebar {
		public constructor(public links: any) {

		}

		public addLink(icon: string | typeof SvelteComponent, id: string) {
			this.links[id] = {
				id,
				icon
			}

			console.log(this.links)
		}
	}