<script lang="ts">
	import type { LockFile } from "../lib/Lock/types";
	import Cookies from "js-cookie";

	function setItem(name: string, event: Event) {
		if (event.target) {
			let target = event.target as HTMLInputElement | HTMLSelectElement;
			Cookies.set(name, target.value);
		}
	}

	export let lockFile: LockFile;
</script>

<form
	action="/"
	class="max-w-[1400px] w-full mx-auto mb-4 flex justify-between gap-4">
	<input
		on:input={(e) => setItem("q", e)}
		value={Cookies.get("q") || ""}
		type="text"
		class="w-[30%] rounded-lg bg-secondary px-4 py-2 border border-dark-blue outline-none transition-colors"
		placeholder="Search..." />
	<select
		on:change={(e) => {
			setItem("db", e);
			window.location.reload();
		}}
		class="rounded-lg bg-secondary px-4 py-2 border border-dark-blue outline-none">
		{#each lockFile.downloads as download}
			<option
				value={download.database}
				selected={Cookies.get("db") == download.database}>
				{download.site.title}
			</option>
		{/each}
	</select>
</form>
