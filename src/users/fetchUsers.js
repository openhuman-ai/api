import { responseError, responseFailed, responseSuccess } from "../response"

export async function fetchUsers(c) {
	try {
		const response = await c.env.DB_OPENHUMAN.prepare("SELECT * FROM users").all()

		if (!response.results) {
			return responseFailed(null, "No users found", 404, corsHeaders)
		}

		return responseSuccess(response.results, "Fetch users success", corsHeaders)
	} catch (err) {
		const errorMessage = err.message || "An unknown error occurred"
		console.log("Exception", err)
		return responseError(err, errorMessage, 401, corsHeaders)
	}
}
