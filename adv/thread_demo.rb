# ruby adv/thread_demo.rb

counter = 0

# Creating and running threads
thread1 = Thread.new do
  5.times { |i| puts "Thread 1: #{i}" }
end

thread2 = Thread.new do
  5.times { |i| puts "Thread 2: #{i}" }
end

# Wait for threads to finish
thread1.join
thread2.join

puts("---------------mutex example below-----------")
mutex = Mutex.new
shared_variable = 0

thread1 = Thread.new do
  mutex.synchronize do
    p shared_variable
    shared_variable += 1
  end
end

thread2 = Thread.new do
  mutex.synchronize do
    p shared_variable
    shared_variable -= 1
  end
end

thread1.join
thread2.join

# 10.times.map do
#   Thread.new do
#     1000.times do
#       p counter
#       counter += 1
#     end
#   end
# end.each(&:join)

