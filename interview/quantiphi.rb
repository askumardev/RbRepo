What issues do you see in this action, and how would you improve it?

def index
  orders = Order.all

  render json: orders.map { |order|
    {
      id: order.id,
      customer: order.customer.name,
      total: order.line_items.sum(&:amount_cents),
      paid: order.payments.any?(&:successful?)
    }
  }
end

groups = Hash.new([])
groups[:t1] << 1
groups[:t2] << 2
p groups
p groups[:t1]

Why do params[:status] and params['status'] both often work in Rails, but not in a plain Ruby hash?

Redis backing Sidekiq is lost during peak traffic. Some jobs were queued, some scheduled, some retrying, and some in flight. How do you estimate loss
and recover?

You need to add a required column and index to a 500-million-row table used by web requests and Sidekiq jobs. What is the safe rollout?

A Rails process grows from 600 MB to 2 GB over a day and restarts. How would you investigate?
