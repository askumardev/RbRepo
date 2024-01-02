mutex1 = Mutex.new
mutex2 = Mutex.new

thread1 = Thread.new do
  puts "Thread 1: Attempting to lock mutex1"
  mutex1.lock
  sleep 1 # Simulate some work
  puts "Thread 1: Attempting to lock mutex2"
  mutex2.lock
  mutex2.unlock
  mutex1.unlock
end

thread2 = Thread.new do
  puts "Thread 2: Attempting to lock mutex2"
  mutex2.lock
  sleep 1 # Simulate some work
  puts "Thread 2: Attempting to lock mutex1"
  mutex1.lock
  mutex1.unlock
  mutex2.unlock
end

thread1.join
thread2.join
