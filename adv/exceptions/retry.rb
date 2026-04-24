require 'net/http'
require 'json'

def fetch_order_status(order_id, retries = 3)
  url = URI("https://jsonplaceholder.typicode.com/posts/#{order_id}")
  attempt = 0

  begin
    attempt += 1
    response = Net::HTTP.get_response(url)

    if response.is_a?(Net::HTTPSuccess)
      return JSON.parse(response.body)
    else
      raise "API Error: #{response.code}"
    end

  rescue => e
    if attempt <= retries
      sleep_time = 2 ** attempt  # exponential backoff
      puts "Retry #{attempt} after #{sleep_time}s due to #{e.message}"
      sleep(sleep_time)
      retry
    else
      puts "Failed after #{retries} attempts"
      raise e
    end
  end
end


puts fetch_order_status(123)


# ruby adv/exceptions/retry.rb
