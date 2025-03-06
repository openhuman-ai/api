export function responseSuccess(c, data, msg) {
	return c.json({ success: true, error: null, msg, data }, 200)
}

export function responseFailed(c, data, msg, status) {
	return c.json({ success: false, error: null, msg, data }, status)
}

export function responseError(c, error, msg, status) {
	return c.json({ success: false, error, msg, data: null }, status)
}
