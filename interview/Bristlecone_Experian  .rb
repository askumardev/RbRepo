
longest substring

array duplicates

debounce logic

virtual DOM

state vs props

database Sharding

api for checkout page

Threads and concurrency while booking a ticket

server side rendering vs client rendering

horizontal and vertical scaling

optimization techniques in react

tiny url design

proc vs lambda

acid properties

Activerecord vs activemodel

-------------------------------------
"Explain the Rails request lifecycle"?

"A request first reaches the web server or reverse proxy and then Puma. 
Puma passes the request into the Rack application. Rails middleware processes 
the request, after which the Rails router matches the HTTP method and path to a 
controller action. Rails runs controller callbacks such as before_action, then 
executes the action. The controller may call ActiveRecord or service objects, 
which can query the database through the connection pool. The controller then 
renders an HTML view or JSON response. The response travels back through Rack 
and the middleware stack, through Puma, and finally back to the client."

------------------------------------

"How do you handle cascading failures in microservices?"

"A cascading failure occurs when one slow or unavailable service causes 
dependent services to consume their threads, connection pools, or other resources 
waiting for it, eventually causing failures across the system. 
I would prevent this using strict timeouts, circuit breakers, bounded retries with 
exponential backoff and jitter, bulkhead isolation, rate limiting, load shedding, 
and asynchronous messaging for non-critical operations. I would also use caching to 
reduce dependency load, idempotency for safe retries, and distributed tracing and 
metrics to detect the source of the failure."
------------------------------------