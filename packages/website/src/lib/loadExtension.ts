import {Underflow} from "./Extensions";

const dir = "./DemoExtension/extension.json"

// Joins path segments.  Preserves initial "/" and resolves ".." and "."
// Does not support using ".." to go above/outside the root.
// This means that join("foo", "../../bar") will not resolve to "../bar"
function join(...p: string[]) {
  // Split the inputs into a list of path commands.
	let parts: string[] = [];
  for (var i = 0, l = arguments.length; i < l; i++) {
    parts = parts.concat(arguments[i].split("/"));
  }
  // Interpret the path commands to get the new resolved path.
  var newParts = [];
  for (i = 0, l = parts.length; i < l; i++) {
    var part = parts[i];
    // Remove leading and trailing slashes
    // Also remove "." segments
    if (!part || part === ".") continue;
    // Interpret ".." to pop the last segment
    if (part === "..") newParts.pop();
    // Push new path segments.
    else newParts.push(part);
  }
  // Preserve the initial slash if there was one.
  if (parts[0] === "") newParts.unshift("");
  // Turn back into a single string path.
  return newParts.join("/") || (newParts.length ? "/" : ".");
}

// A simple function to get the dirname of a path
// Trailing slashes are ignored. Leading slash is preserved.
function dirname(path: string) {
  return join(path, "..");
}

export function loadExtension() {
	import(dir).then(json => {
		// Import the main script
		if (json.main) {
			import("./" + join("./" + dirname(dir), json.main)).then(module => {
				module.activate(new Underflow.ExtensionContext())
			})
		}

		if (json.contributes && json.contributes.views) {
			json.contributes.views.forEach(({ icon, id, title }) => {
				console.log(icon, id, title)
			})
		}
	})
}