module Workable
  def work; end
end

module Eatable
  def eat; end
end

class Human
  include Workable
  include Eatable
end

class Robot
  include Workable
end
