class Invoice < ApplicationRecord
  belongs_to :person

  # Delegate :greet to person, but ensure method names are distinct
  delegate :greet, to: :person, allow_nil: true

  # A distinct method in Invoice
  def invoice_message
    'hello from invoice'
  end
end

class Person < ApplicationRecord
  has_one :invoice

  # Delegate :invoice_message to invoice, keeping method names unique
  delegate :invoice_message, to: :invoice, allow_nil: true

  # A distinct method in Person
  def greet
    'hello from person'
  end

  def goodbye
    'goodbye'
  end
end

  


# ruby basics/delegate.rb