# Proxy:
# Provides a surrogate that controls access to another object.

class Service
  def fetch
    "Sensitive service data"
  end
end

class ProtectedServiceProxy
  def initialize(role)
    @role = role
    @service = Service.new
  end

  def fetch
    return "Access denied" unless @role == "admin"

    @service.fetch
  end
end

puts ProtectedServiceProxy.new("guest").fetch
puts ProtectedServiceProxy.new("admin").fetch
