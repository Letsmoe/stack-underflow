import type { APIContext } from "astro";

export const post = async ({params, request}: APIContext<Record<string, any>>, success, error) => {
	const body = await request.json();

	if (!body.install || !body.name) {
		return error(["Missing required parameters 'name' and 'install'."])
	}

	return success({})
}