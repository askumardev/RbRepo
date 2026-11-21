# main.rb
require_relative 'job_queue'
require_relative 'worker'
require_relative 'jobs/email_job'

queue = JobQueue.new

# Start workers
workers = []
3.times do |i|
  workers << Worker.new(queue, i).start
end

# Push jobs
queue.push(EmailJob, "satish@test.com")
queue.push(EmailJob, "dev@test.com")
queue.push(EmailJob, "admin@test.com")

puts "Jobs enqueued!"

# Keep program alive
sleep 10


# ruby adv/background_jobs/mini_sidekiq/main.rb


#Push job → Queue → Worker → Execute → Retry
