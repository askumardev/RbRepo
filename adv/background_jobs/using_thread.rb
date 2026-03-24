def send_email
  puts "Starting email sending..."
  sleep 3   # simulate slow task
  puts "Email sent!"
end

puts "User clicks button"

Thread.new do
  send_email
end

puts "User continues browsing..."
sleep 5   # keep program alive

# ruby adv/background_jobs/using_thread.rb
