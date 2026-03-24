# job_queue.rb
require 'thread'

class JobQueue
  def initialize
    @queue = Queue.new
  end

  def push(job_class, *args)
    @queue << { job: job_class, args: args, retries: 0 }
  end

  def pop
    @queue.pop
  end
end
