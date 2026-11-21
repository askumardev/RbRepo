require 'thread'

queue = Queue.new

# Worker thread
worker = Thread.new do
  loop do
    job = queue.pop
    puts "Processing job: #{job}"
    sleep 2
    puts "Finished job: #{job}"
  end
end

# Add jobs
queue << "Send Email"
queue << "Generate Report"
queue << "Process Image"

puts "Jobs added!"

sleep 7

# ruby adv/background_jobs/using_queue.rb
