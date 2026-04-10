# ruby solid/open_closed.rb

class Payment
  def pay(strategy)
    strategy.pay
  end
end

class CreditCardPayment
  def pay
    puts "Pay via credit card"
  end
end

class PaypalPayment
  def pay
    puts "Pay via PayPal"
  end
end

payment = Payment.new
payment.pay(CreditCardPayment.new)

payment.pay(PaypalPayment.new)
