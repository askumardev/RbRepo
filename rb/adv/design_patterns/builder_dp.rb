# Builder:
# Separates construction of a complex object from its representation.
# The step-by-step API avoids constructors with many optional arguments.

class Computer
  attr_accessor :cpu, :memory, :storage, :graphics

  def specification
    "CPU=#{cpu || 'none'}, Memory=#{memory || 'none'}, " \
      "Storage=#{storage || 'none'}, Graphics=#{graphics || 'none'}"
  end
end

class ComputerBuilder
  def initialize
    @computer = Computer.new
  end

  def cpu(value)
    @computer.cpu = value
    self
  end

  def memory(value)
    @computer.memory = value
    self
  end

  def storage(value)
    @computer.storage = value
    self
  end

  def graphics(value)
    @computer.graphics = value
    self
  end

  def build
    @computer
  end
end

gaming_pc = ComputerBuilder.new
  .cpu("AMD Ryzen")
  .memory("32 GB")
  .storage("1 TB SSD")
  .graphics("RTX")
  .build

puts gaming_pc.specification
