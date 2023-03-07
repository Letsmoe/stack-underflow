import type { SvelteComponent } from "svelte";
import { addMessage } from "../../components/MessageHandler";
import { addViewTarget } from "../../components/Sidebar/Sidebar.svelte";

export namespace Underflow {
	export class ExtensionContext {
	
	}

	export class Window {
		constructor() {

		}

		public static showMessage(message: string) {
			addMessage({ type: "info", text: message })
		}
	}

	export class Sidebar {
		public static addView(id: string, component: typeof SvelteComponent) {
			let icon = "";
			addViewTarget({ icon, id, link: "" })
		}
	}

	export interface ViewTarget {
		icon: ConstructorOfATypedSvelteComponent | string,
		link: string,
		id: string
	}
}