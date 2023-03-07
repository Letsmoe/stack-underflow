<script lang="ts">
  import type { Bookmarks } from "../lib/Bookmarks";
  import Post from "./Post.svelte";

	export let bookmarks: Bookmarks;
	let bookmarkValues = Object.values(bookmarks);
</script>

<div class="w-full">
	<h1 class="text-3xl font-medium mb-6">Bookmarks</h1>
	{#if Object.values(bookmarks).length == 0}
		<p class="text-lg">It seems like you don't have any bookmarks right now. To add bookmarks, simply click on a question you find interesting, in the bottom right corner a button will appear with a bookmark sign inside of it. Click it!</p>
		<p class="text-lg">Any bookmark you set will be stored on your computer in a file called <code>/persistent/bookmarks.json</code>, that way your bookmarks never get lost when you clear your browser cookies and/or localStorage.</p>
	{/if}
	<ul>
		{#each bookmarkValues as bookmark}
		<Post post={bookmark.data}></Post>
		{/each}
	</ul>
</div>