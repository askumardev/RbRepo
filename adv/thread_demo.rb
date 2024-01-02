counter = 0

10.times.map do
  Thread.new do
    1000.times do
      p counter
      counter += 1
    end
  end
end.each(&:join)
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

