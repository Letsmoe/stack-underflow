<script lang="ts">
	import { Card, Tabs, TabList, TabPanel, Tab } from "@underflow/ui";
	import Official from "../lib/official";

	export let docsets: Record<string, any>;
	export let lockFile: any;

	function toggleInstall(active: boolean, pkg: string) {
		fetch("/api/dock/install", {
			method: "POST",
			body: JSON.stringify({
				install: active,
				name: pkg
			})
		})
	}

	const installed = lockFile.plugins["docs-loader"].installed;
</script>

<Tabs>
	<TabList>
		<Tab>Installed</Tab>
		<Tab>Official</Tab>
		<Tab>Community</Tab>
	</TabList>
	<TabPanel>
		<div class="grid grid-cols-3 gap-4 py-8">
			{#each Official as docset}
				{#if docset.name in installed}
				<Card
					title={docset.title}
					description={docset.description}
					button="View"
					link={docset.link}
					showSwitch={true}
					icon={docset.icon}
					switchToggled={true}
					onToggleSwitch={(active) => toggleInstall(active, docset.name)}
				/>
				{/if}
			{/each}
		</div>
	</TabPanel>
	<TabPanel>
		<div class="grid grid-cols-3 gap-4 py-8">
			{#each Official as docset}
				<Card
					title={docset.title}
					description={docset.description}
					button="View"
					link={docset.link}
					showSwitch={true}
					icon={docset.icon}
					switchToggled={docset.name in installed}
					onToggleSwitch={(active) => toggleInstall(active, docset.name)}
				/>
			{/each}
		</div>
	</TabPanel>
	<TabPanel>
		<div class="grid grid-cols-3 gap-4 py-8">
			{#each Object.entries(docsets) as [name, docset]}
				<Card
					title={name}
					description=""
					button="View"
					link=""
					switchToggled={name in installed}
					icon={"data:image/png;base64," + docset["icon@2x"]}
				/>
			{/each}
		</div>
	</TabPanel>
</Tabs>