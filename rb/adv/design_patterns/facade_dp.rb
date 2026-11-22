# Facade:
# Provides a simple interface to a complex subsystem.

class Inventory
  def reserve(item)
    "Reserved #{item}"
  end
end

class Payment
  def charge(amount)
    "Charged #{amount}"
  end
end

class Shipping
  def dispatch(item)
    "Dispatched #{item}"
  end
end

class CheckoutFacade
  def initialize
    @inventory = Inventory.new
    @payment = Payment.new
    @shipping = Shipping.new
  end

  def purchase(item, amount)
    [
      @inventory.reserve(item),
      @payment.charge(amount),
      @shipping.dispatch(item)
    ]
  end
end

puts CheckoutFacade.new.purchase("Ruby book", "$25")
