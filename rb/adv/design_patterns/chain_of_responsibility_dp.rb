# Chain of Responsibility:
# Passes a request along a chain until one handler processes it.

class SupportHandler
  def initialize(next_handler = nil)
    @next_handler = next_handler
  end

  def handle(request)
    if can_handle?(request)
      process(request)
    elsif @next_handler
      @next_handler.handle(request)
    else
      "No handler for #{request}"
    end
  end

  def can_handle?(_request)
    false
  end

  def process(request)
    "Handled #{request}"
  end
end

class BasicSupport < SupportHandler
  def can_handle?(request)
    request == "password"
  end
end

class TechnicalSupport < SupportHandler
  def can_handle?(request)
    request == "crash"
  end

  def process(request)
    "Technical support handled #{request}"
  end
end

chain = BasicSupport.new(TechnicalSupport.new)
puts chain.handle("password")
puts chain.handle("crash")
puts chain.handle("billing")
