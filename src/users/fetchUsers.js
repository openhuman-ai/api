import { responseError, responseFailed, responseSuccess } from "../response"

export async function fetchUsers(c) {
	try {
		const db = c.env.DB_OPENHUMAN
		if (!db) {
			return responseFailed(c, null, "Failed to connect to database", 400)
		}

		const { results } = await db.prepare("SELECT * FROM users").all()

		if (!results || results.length === 0) {
			return responseSuccess(c, [], "No users found")
		}

		return responseSuccess(c, results, "Fetch users success")
	} catch (err) {
		console.error("Error getting messages:", error)
		return responseFailed(c, null, "Failed to get messages", 500)
	}
}
