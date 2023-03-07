import { query } from "../database";

export async function getPost(id: number) {
	const result = await query("SELECT * FROM posts WHERE id = $1", [id]);

	if (result.rowCount > 0) {
		const post = result.rows[0]
		return post;
	}
}