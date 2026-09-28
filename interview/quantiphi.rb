What issues do you see in this action, and how would you improve it?

def index
  orders = Order.all

  render json: orders.map { |order|
    {
      id: order.id,
      customer: order.customer.name,
      total: order.line_items.sum(&: amount_cents),
      paid: order.payments.any?(&: successful?)
    }
  }
end
## Issues and Solutions

# | Issue                                  | Why it's bad                                             | Rails Solution                                                      |
# |----------------------------------------|----------------------------------------------------------|---------------------------------------------------------------------|
# | `Order.all`                            | Loads the entire table into memory                       | Use pagination (`limit`, `page`) or `find_each` for background jobs |
# | `order.customer.name`                  | N+1 query (1 query for orders + N queries for customers) | `Order.includes(:customer)`                                         |
# | `order.line_items.sum(&:amount_cents)` | Loads all line items into Ruby and sums them             | `order.line_items.sum(:amount_cents)` (SQL performs the SUM)        |
# | `order.payments.any?(&:successful?)`   | Loads all payments into Ruby to check success            | `order.payments.where(successful: true).exists?`                    |
# |--------------------------------------- |----------------------------------------------------------|---------------------------------------------------------------------|
# ### Interview Summary

# - Use **pagination** instead of `Order.all`.
# - Use **`includes`** to eliminate N+1 queries.
# - Use **SQL aggregation** with `sum(:column)` instead of Ruby `sum(&:method)`.
# - Use **`exists?`** instead of `any?` for database existence checks.
def index
  orders = Order
             .includes(:customer)
             .limit(100)

  render json: orders.map { |order|
    {
      id: order.id,
      customer: order.customer.name,
      total: order.line_items.sum(:amount_cents),
      paid: order.payments.where(successful: true).exists?
    }
  }
end






# There are a few issues and potential improvements in the provided `index` action:
# “I see several issues. First, map materializes all orders, so there's no pagination and potentially high memory usage. 
# Second, customer, line_items, and payments can all introduce N+1 queries. 
# Third, the line-item sum and payment check are being performed in Ruby rather than efficiently in SQL. 
# I'd add pagination, eager-load the customer, push aggregations and existence checks into the database, 
# and for a large dataset I'd consider a single optimized query or precomputed aggregates. 
# I'd also verify the final query with EXPLAIN ANALYZE and make sure the relevant foreign keys and indexes exist.”


groups = Hash.new([])
groups[:t1] << 1
groups[:t2] << 2
p groups            # {}
p groups[:t1]       # [1, 2]

Why do params[:status] and params['status'] both often work in Rails, but not in a plain Ruby hash?
# h = ActiveSupport::HashWithIndifferentAccess.new

# h[:status] = "active"

# p h["status"]   # "active"
# p h[:status]    # "active"
# In Rails, `params` is an instance of `ActionController::Parameters`, which is a subclass of `HashWithIndifferentAccess`. 
# This means that it allows you to access values using either string or symbol keys interchangeably. 
# So, `params[:status]` and `params['status']` will both return the same value.

# In contrast, a plain Ruby hash does not have this behavior. 
# In a standard Ruby hash, keys are treated as distinct objects, so `hash[:status]` and `hash['status']` 
# would refer to different keys. If you try to access a key using a symbol when it was stored as a 
# string (or vice versa), you will get `nil` because the key does not exist in that form.

Redis backing Sidekiq is lost during peak traffic. Some jobs were queued, some scheduled, some retrying, and some in flight. How do you estimate loss
and recover?
# First, I'd identify the Redis outage window and determine whether any Redis persistence was available. 
# Next, I'd classify Sidekiq jobs into queued, scheduled, retrying, and in-flight because each category 
# requires different handling. To estimate loss, I would compare business state in PostgreSQL—for example, 
# orders created versus fulfilled, payments completed, or emails sent—to identify incomplete operations 
# rather than relying on Redis alone. Then I'd recover queued, scheduled, and retry jobs by querying unfinished 
# records and re-enqueuing only those jobs. For in-flight jobs, I'd verify Rails logs, database state, and 
# external systems before replaying them because some may have completed before Redis failed. 
# Finally, I'd ensure all Sidekiq jobs are idempotent and use external API idempotency keys so replaying jobs 
# cannot create duplicate business actions.

You need to add a required column and index to a 500-million-row table used by web requests and Sidekiq jobs. What is the safe rollout?
# I would use an expand-and-contract rollout. First, add the new column as nullable so the schema change is safe. 
# Next, deploy Rails code that writes the new column for all new records. Then backfill the existing 500 million rows 
# in small batches using in_batches or Sidekiq to avoid long transactions. 
# After the backfill, create the index using algorithm: :concurrently so PostgreSQL doesn't block writes. 
# Finally, verify there are no NULL values and make the column NOT NULL. 
# This avoids downtime and keeps both web requests and Sidekiq jobs running safely.


A Rails process grows from 600 MB to 2 GB over a day and restarts. How would you investigate?
# First, I'd confirm that memory is gradually increasing rather than experiencing temporary spikes. 
# Then I'd identify whether the leak is in the Puma web process or Sidekiq. Next, I'd use tools like 
# rack-mini-profiler and memory_profiler to find which endpoints or jobs are allocating excessive objects. 
# I'd inspect common Rails issues such as Order.all, large arrays, N+1 queries, and oversized JSON responses.
# After fixing the code—for example replacing all with find_each—I'd deploy the change and monitor memory to 
# verify the process remains stable.

# Interview follow-up: How do you prevent this?

# Use find_each for large datasets.
# Paginate API responses.
# Avoid global variables and class-level caches.
# Profile memory before optimizing.
# Monitor Puma and Sidekiq memory separately.