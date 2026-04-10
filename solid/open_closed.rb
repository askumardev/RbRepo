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



# Software entities such as classes, modules, methods, etc should be open for extension but close for modification

# This principal’s primary goal is to design the code’s architecture in such a way that functionality
# can be extended rather than modified or refactored.
