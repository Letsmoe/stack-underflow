<script lang="ts">
	export let post: any;
	export let db: string;

	const creationDate = new Date(post.creationdate)
	
	function getMonthName(monthNumber: number) {
		const date = new Date();
		date.setMonth(monthNumber - 1);

		return date.toLocaleString('en-US', { month: 'long' });
	}

	let tags: string[] = [];
	if (post.tags) {
		tags = post.tags.split(/<(.*?)>/g).filter((x: any) => x)
	}
</script>

<li class="group shadow-sm px-4 py-4 mb-4 rounded-lg border border-dark-blue hover:bg-violet-50 cursor-pointer transition-all bg-secondary">
	<a href={`/post/${post.id}?db=${db}`}>
		<div class="flex flex-row">
			<div class="flex flex-col pr-4 items-center">
				{#if post.acceptedanswerid !== null}
				<svg width="35" height="35" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M7.49991 0.877045C3.84222 0.877045 0.877075 3.84219 0.877075 7.49988C0.877075 11.1575 3.84222 14.1227 7.49991 14.1227C11.1576 14.1227 14.1227 11.1575 14.1227 7.49988C14.1227 3.84219 11.1576 0.877045 7.49991 0.877045ZM1.82708 7.49988C1.82708 4.36686 4.36689 1.82704 7.49991 1.82704C10.6329 1.82704 13.1727 4.36686 13.1727 7.49988C13.1727 10.6329 10.6329 13.1727 7.49991 13.1727C4.36689 13.1727 1.82708 10.6329 1.82708 7.49988ZM10.1589 5.53774C10.3178 5.31191 10.2636 5.00001 10.0378 4.84109C9.81194 4.68217 9.50004 4.73642 9.34112 4.96225L6.51977 8.97154L5.35681 7.78706C5.16334 7.59002 4.84677 7.58711 4.64973 7.78058C4.45268 7.97404 4.44978 8.29061 4.64325 8.48765L6.22658 10.1003C6.33054 10.2062 6.47617 10.2604 6.62407 10.2483C6.77197 10.2363 6.90686 10.1591 6.99226 10.0377L10.1589 5.53774Z" fill="" class="fill-pastel-green" fill-rule="evenodd" clip-rule="evenodd"></path></svg>
				{/if}
				<div class="flex flex-col items-center">
					<svg class="group" width="50" height="50" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M4 9H11L7.5 4.5L4 9Z" fill="#aaa" class="group-hover:fill-violet-600"></path></svg>
					<span class="text-lg">{post.score}</span>
					<svg class="group" width="50" height="50" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M4 6H11L7.5 10.5L4 6Z" fill="#aaa" class="group-hover:fill-violet-600"></path></svg>
				</div>
			</div>
			<div class="flex flex-col">
				<span class="text-slate-500 text-sm">Asked: {getMonthName(creationDate.getMonth())} {creationDate.getDate()}, {creationDate.getFullYear()}</span>
				<h2 class="text-slate-900 text-xl mb-4 font-medium group-hover:underline">{post.title}</h2>
				<div class="max-w-[150ch]">{@html post.body.split(/<p>(.*?)<\/p>/)[1]}</div>
				<div class="flex flex-row gap-2 mt-4 flex-wrap">
					{#each tags as tag}
						<span class="px-2 py-0.5 bg-violet-600 rounded-lg text-white font-medium text-sm">
							{tag}
						</span>
					{/each}
				</div>
			</div>
		</div>
	</a>
</li>