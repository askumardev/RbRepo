Address = Struct.new(:street, :city, :zip)

class Address
  def full_address
    p "#{street} #{city} #{zip}"
  end
end

home = Address.new('Broadway', 'NYC', 10040)
home.full_address # => "Broadway NYC 10040"

p("-----------alternate way------")

Struct.new('Address', :street, :city, :zip)
Struct::Address.superclass # => Struct

home = Struct::Address.new('Broadway', 'NYC', 10040)
p home.class # => Struct::Address
p home.city # "NYC"