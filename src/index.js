import { Hono } from "hono"
import { cors } from "hono/cors"
import { responseSuccess, responseFailed, responseError } from "./response"
import { handleGithubCallback } from "./auth/handleGithubCallback"
import { handleGetUser } from "./auth/handleGetUser"
import { handleLogout } from "./auth/handleLogout"
import { handleGoogleCallback } from "./auth/handleGoogleCallback"
import { API_VERSION } from "./config/constants"
import { fetchUsers } from "./users/fetchUsers"

const app = new Hono()

// Middleware for CORS
app.use(
	"*",
	cors({
		origin: (origin) => origin,
		allowMethods: ["GET", "HEAD", "POST", "OPTIONS", "PATCH"],
		allowHeaders: ["Content-Type"],
		credentials: true,
		maxAge: 86400,
	})
)

// Auth routes
app.get("/auth/callback/github", handleGithubCallback)
app.get("/auth/callback/google", handleGoogleCallback)
app.post("/auth/create", createUser)

// Document API routes
const apiRoutes = new Hono()
apiRoutes.use(
	`/api/${API_VERSION}`,
	cors({
		origin: (origin) => origin,
		allowMethods: ["GET", "HEAD", "POST", "OPTIONS", "PATCH"],
		allowHeaders: ["Content-Type"],
		credentials: true,
		maxAge: 86400,
	})
)

// ~~~~~~ Chat ~~~~~~
// xSingle chat operations
// apiRoutes.get("/chats/:id", getChatById)
// apiRoutes.delete("/chats/:id", deleteChat)
// apiRoutes.get("/chats", getChatsByUserId)

// // Chat stream
// apiRoutes.post("/chat/:id", fetchStreamChat)

// ~~~~~~ Auth ~~~~~~
apiRoutes.get("/auth/user", handleGetUser)
apiRoutes.post("/auth/logout", handleLogout)
apiRoutes.post("/users", fetchUsers)

app.route(`/api/${API_VERSION}`, apiRoutes)

// 404 handler
app.notFound((c) => responseFailed(c, null, "Invalid API endpoint", 404))

// Global error handler
app.onError((err, c) => {
	console.error("Exception:", err)
	return responseError(c, err.message || "An unknown error occurred", 500)
})

export default app
