Fundamental questions
1. What is middleware in Ruby on Rails?
2. What is Rack?
3. How does Rack work internally?
4. What is the difference between Rack and Rails middleware?
5. Explain the Rails request-response lifecycle.
6. What happens when a request reaches a Rails application?
7. What is the Rack application interface?
8. What are call, env, and response in Rack?
9. What is middleware chaining?
10. What is the difference between middleware and controller callbacks?


Practical and scenario-based questions
11. How do you create custom middleware in Rails?
12. How do you register custom middleware?
13. How do you remove middleware from the middleware stack?
14. How do you inspect the middleware stack?
15. How would you implement request logging using middleware?
16. How would you measure API execution time using middleware?
17. How would you implement request authentication using middleware?
18. How would you handle exceptions in middleware?
19. How would you add custom headers to every API response?
20. How would you implement request ID tracking?


Be prepared to explain:
- Why middleware receives app in its initializer.
- Why call receives env.
- Why @app.call(env) is necessary.
- Why middleware returns three elements.
- Why Process::CLOCK_MONOTONIC is preferred for measuring duration.


2. Rack internals and Rails request lifecycle
These questions test whether you understand what happens behind a Rails request.
1. Explain the complete Rails request lifecycle.
2. What happens internally when a browser sends an HTTP request?
3. What is Rack and why does Rails depend on it?
4. What is Rack::Builder?
5. What is the difference between config.middleware.use and insert_before?
6. What is the difference between use, insert_before, insert_after, and delete?
7. What is the difference between Puma and Rack?
8. How does Rails handle HTTP requests concurrently?
9. What happens if middleware doesn't call the next application?
10. Can middleware modify request parameters and response headers?



4. API and middleware architecture
Prepare these scenario-based questions.
1. How would you design middleware for API authentication?
2. How would you implement API rate limiting?
3. How would you prevent duplicate API requests?
4. How would you implement idempotency?
5. How would you implement centralized exception handling?
6. How would you trace a request across multiple microservices?
7. How would you implement correlation IDs?
8. How would you handle API timeouts?
9. How would you implement retry mechanisms?
10. How would you handle third-party API failures?
11. How would you implement request throttling?
12. How would you design a reusable middleware component?


5. Database and SQL questions
Scientific Games develops gaming and lottery technology, where transactional correctness, security and reliability are important. Its official technology portfolio includes central gaming systems, digital lottery and retail solutions. 
scientificgames.com+1


Prepare:
1. Difference between INNER JOIN and LEFT JOIN.
2. What are database indexes?
3. How do composite indexes work?
4. What is a clustered vs non-clustered index?
5. How do you identify a slow SQL query?
6. What is EXPLAIN ANALYZE?
7. What is database normalization?
8. What are database transactions?
9. What is the difference between DELETE, TRUNCATE and DROP?
10. How do you prevent race conditions during concurrent database updates?
11. What are database deadlocks?
12. How do you optimize queries on a table containing millions of records?



6. Redis, Sidekiq and background processing
1. How does Redis work internally?
2. Why does Sidekiq use Redis?
3. What happens when Redis becomes unavailable?
4. How does Sidekiq retry failed jobs?
5. How do you prevent duplicate job execution?
6. What is job idempotency?
7. What happens if a worker crashes while processing a job?
8. How do you manage Sidekiq concurrency?
9. How do you avoid database connection pool exhaustion?
10. Difference between Redis cache and Redis persistence.



7. Concurrency and system design
These are important for senior-level technical discussions.
1. What is concurrency vs parallelism?
2. How does Ruby's GIL work?
3. How does Puma handle multiple requests?
4. What is a race condition?
5. How do you prevent two users from purchasing the same ticket?
6. How do you guarantee unique ticket numbers?
7. How do you handle concurrent transactions?
8. How would you design a highly available API?
9. How would you handle sudden traffic spikes?
10. How would you design a real-time lottery result notification system?


8. Ruby programming and OOP
Prepare these questions:
1. Proc vs Lambda.
2. Blocks vs Procs vs Lambdas.
3. include vs extend vs prepend.
4. class_eval vs instance_eval.
5. What is method lookup in Ruby?
6. What is the difference between private, protected and public?
7. What is metaprogramming?
8. What are method_missing and respond_to_missing?
9. What are modules and mixins?
10. How does garbage collection work in Ruby?
11. What is the difference between shallow copy and deep copy?
12. How do you implement Singleton in Ruby?
13. What are SOLID principles?
14. Explain dependency injection.
15. Explain common design patterns used in Rails.


10. Questions specifically about your previous projects
This is where you should spend significant preparation time. Interviewers often go deeper into your resume than expected.

Prepare answers to:
1. Explain your current project architecture.
2. What was your role and responsibility?
3. Explain one challenging production issue you resolved.
4. How did you improve API response time?
5. How did you identify and resolve N+1 queries?
6. How did you improve test coverage?
7. How did you use Redis in your project?
8. How did you implement background jobs?
9. How did you handle production exceptions?
10. How did you monitor application performance?
11. How do you review code written by junior developers?
12. How would you migrate a monolithic Rails application to microservices?


Possible domain-related questions:
1. How would you design a lottery ticket purchase API?
2. How would you prevent duplicate ticket generation?
3. How would you ensure transaction consistency?
4. How would you maintain an audit trail for ticket purchases?
5. How would you secure sensitive transaction information?
6. How would you handle high-volume concurrent requests?
7. How would you ensure a lottery result is not published twice?
8. How would you design a reliable notification system?


13. Five questions you must answer confidently
Before the interview, make sure you can explain these without hesitation:
1. What happens internally when a Rails request enters the application?
2. How does Rack middleware work, and how would you write custom middleware?
3. How would you implement authentication, logging and rate limiting using middleware?
4. How would you handle concurrent requests and prevent duplicate transactions?
5. How would you troubleshoot a slow API in production?


Interview follow-up questions
Make sure you understand these next:
1. What is Rack, and why does Rails use Rack?
2. What is the difference between Rack and Rails middleware?
3. What happens internally when @app.call(env) executes?
4. What happens if middleware does not call @app.call(env)?
5. What is the difference between middleware and before_action?
6. How would you implement API authentication using custom middleware?