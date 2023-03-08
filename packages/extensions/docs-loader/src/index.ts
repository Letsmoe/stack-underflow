import Index from "./index.astro";
import PackageIndex from "./content/index.astro";
import SvelteContent from "./content/content.astro";
import Icon from "./components/Icon.svelte";
import { post as installMethodPost } from "./api/install";

export const config = {
	views: [
		{
			id: "/dock",
			component: Index,
			options: {
				title: "Documentation Downloader"
			}
		},
		{
			id: "/dock/[pkg]",
			component: PackageIndex,
			options: {
				title: "Documentation"
			}
		},
		{
			id: "/dock/[pkg]/[slug]",
			component: SvelteContent,
			options: {
				title: "Svelte Documentation"
			}
		},
	],
	api: [
		{
			id: "dock/install",
			handler: installMethodPost,
			method: "POST"
		}
	],
	links: [{
		id: "/dock",
		icon: Icon
	}]
};

export function activate(context: any) {
	console.log(context)
}
