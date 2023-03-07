// rollup.config.js
import svelte from 'rollup-plugin-svelte';
import resolve from '@rollup/plugin-node-resolve';
import typescript from '@rollup/plugin-typescript';

export default {
	input: 'src/plugin.ts',
	output: {
		file: 'dist/bundle.js',
		format: "umd",
		name: "plugin"
	},
	plugins: [
		svelte({
			// You can restrict which files are compiled
			// using `include` and `exclude`
			include: 'src/components/**/*.svelte',

			// You can pass any of the Svelte compiler options
			compilerOptions: {
				// ensure that extra attributes are added to head
				// elements for hydration (used with generate: 'ssr')
				hydratable: true,
			}
		}),
		typescript({
			sourceMap: true,
			sourceRoot: "./types"
		}),
		// see NOTICE below
		resolve({
			browser: true,
			exportConditions: ['svelte'],
			extensions: ['.svelte']
		}),
		// ...
	]
}