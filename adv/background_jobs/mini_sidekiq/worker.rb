# worker.rb
class Worker
  MAX_RETRIES = 3

  def initialize(queue, id)
    @queue = queue
    @id = id
  end

  def start
    Thread.new do
      loop do
        job_data = @queue.pop
        process(job_data)
      end
    end
  end

  def process(job_data)
    job_class = job_data[:job]
    args = job_data[:args]
    retries = job_data[:retries]

    begin
      puts "[Worker #{@id}] Processing #{job_class} with #{args}"
      job_class.new.perform(*args)
      puts "[Worker #{@id}] Done"
    rescue => e
      puts "[Worker #{@id}] Error: #{e.message}"

      if retries < MAX_RETRIES
        job_data[:retries] += 1
        puts "[Worker #{@id}] Retrying (#{job_data[:retries]})..."
        @queue.push(job_class, *args)
      else
        puts "[Worker #{@id}] Failed permanently ❌"
      end
    end
  end
end
