<script lang="ts">
  import { onMount } from "svelte";
  import type { Underflow } from "../../lib/Extensions";
  import MixerVertical from "../Icons/MixerVertical.svelte";
	import { ViewButtons } from "./shared";
  import type { ViewLinks } from "./types";

	let isDarkMode = false;

	onMount(() => {
		if (localStorage.theme === 'dark' || (!('theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
		document.documentElement.classList.add('dark')
		isDarkMode = true;
	} else {
		document.documentElement.classList.remove('dark')
		isDarkMode = false;
	}
	})

	function toggleDarkMode() {
		isDarkMode = !isDarkMode
		if (isDarkMode) {
			document.documentElement.classList.add('dark')
			localStorage.setItem("theme", "dark")
		} else {
			document.documentElement.classList.remove('dark')
			localStorage.setItem("theme", "light")
		}
	}
	
	let localViews: ViewLinks = {};
	ViewButtons.subscribe((value) => localViews = value)
	ViewButtons.update(x => x)
</script>

<script context="module" lang="ts">
	function addViewTarget({ link, icon, id }: Underflow.ViewTarget) {
		ViewButtons.update(data => {
			let obj: ViewLinks = {};
			obj[id] = {link, icon, id};
			return { ...data, ...obj }
		});
	}

	export {addViewTarget}
</script>

<div class="w-[80px] border-r border-r-dark-blue fixed top-0 left-0 flex flex-col items-center px-2 py-8 h-full justify-between bg-secondary">
	<div class="w-full flex flex-col items-center gap-4">
		{#each Object.entries(localViews) as [id, button]}
			<a href={button.link}>
				{#if typeof button.icon == "string"}
					<img src={button.icon}>
				{:else}
					<svelte:component this={button.icon}></svelte:component>
				{/if}
			</a>
		{/each}
	</div>

	<div class="w-full flex flex-col items-center gap-4">
		<a on:click={toggleDarkMode}>
			
		</a>
		<a href="/help">
			
		</a>
		<a href="/settings">
			<MixerVertical></MixerVertical>
		</a>
	</div>
</div>

<style lang="scss">
	a {
		@apply rounded-lg p-2 transition-colors duration-200 hover:bg-primary;
	}

	a svg {
		@apply fill-dark-blue;
	}
</style>