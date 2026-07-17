# HTTP Status Codes Reference

## 2xx — Success

| Code | Name | Rails Usage |
| --- | --- | --- |
| 200 | OK | Default for successful GET, PATCH |
| 201 | Created | POST that creates a resource — `render json: @user, status: :created` |
| 202 | Accepted | Async job queued, not yet completed |
| 204 | No Content | Successful DELETE, or PATCH with no body — `head :no_content` |

## 3xx — Redirection

| Code | Name | Rails Usage |
| --- | --- | --- |
| 301 | Moved Permanently | Permanent URL change — `redirect_to new_url, status: :moved_permanently` |
| 302 | Found | Default for `redirect_to` — temporary redirect |
| 304 | Not Modified | Conditional GET with caching — `fresh_when` / `stale?` |

## 4xx — Client Errors

| Code | Name | Rails Usage |
| --- | --- | --- |
| 400 | Bad Request | Malformed params/JSON |
| 401 | Unauthorized | Not authenticated — `render status: :unauthorized` |
| 403 | Forbidden | Authenticated but not authorized — Pundit `NotAuthorizedError` |
| 404 | Not Found | `ActiveRecord::RecordNotFound` — Rails auto-renders 404 in production |
| 405 | Method Not Allowed | Wrong HTTP verb on a route |
| 409 | Conflict | Optimistic locking failure (`ActiveRecord::StaleObjectError`), duplicate resource |
| 422 | Unprocessable Entity | Failed validations — `render json: @user.errors, status: :unprocessable_entity` |
| 429 | Too Many Requests | Rate limiting (Rack::Attack) |

## 5xx — Server Errors

| Code | Name | Rails Usage |
| --- | --- | --- |
| 500 | Internal Server Error | Unhandled exception — Rails default error page |
| 502 | Bad Gateway | Upstream service failure (e.g. Puma behind Nginx down) |
| 503 | Service Unavailable | Maintenance mode, or `rescue_from` for a dependency outage |
| 504 | Gateway Timeout | Upstream request timed out |
