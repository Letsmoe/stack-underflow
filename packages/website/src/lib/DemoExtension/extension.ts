import { Underflow } from "../Extensions";
import Webview from "./webview.svelte";

export function activate(context: Underflow.ExtensionContext) {
	Underflow.Window.showMessage("Extension initialized.")


	Underflow.Sidebar.addView("custom-webview", Webview)
}