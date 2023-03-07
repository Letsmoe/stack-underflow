<script lang="ts">
	import Post from "./Post.svelte";
	export let db: string;
	export let posts: any[];
</script>

<ul class="grid grid-cols-2 gap-4 max-w-[1400px] mx-auto">
	{#each posts as post}
		<Post post={post} db={db}></Post>
	{/each}
</ul>