import type { SvelteComponentDev } from "svelte/internal";
import type { AstroComponent } from ".";

export class View {
	public constructor(public config: any, public views: any) {

	}

	public onVisit(id: string, callback: () => any) {
		if (this.config.currentView == id) {
			callback();
		}
	}

	public add(
		id: string,
		component: AstroComponent | typeof SvelteComponentDev,
		options?: {
			title: string;
		}) {
			options = Object.assign(
				{
					title: "StackUnderflow",
				},
				options
			);
			this.views[id] = {
				component,
				options,
			};
		}
}