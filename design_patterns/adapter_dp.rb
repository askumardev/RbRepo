# The Adapter pattern allows the interface of an existing class to be used as another interface. 
# It is often used to make existing classes work with others without modifying their source code.

class OldPrinter
  def print_old(text)
    puts "Printing: #{text}"
  end
end

class NewPrinter
  def print(text)
    puts "New Printing: #{text}"
  end
end

class PrinterAdapter
  def initialize(old_printer)
    @old_printer = old_printer
  end

  def print(text)
    @old_printer.print_old(text)
  end
end

old_printer = OldPrinter.new
adapter = PrinterAdapter.new(old_printer)

# Now we can use old printer with the new interface
adapter.print("Hello, World!")  # Output: Printing: Hello, World!


# ruby design_patterns/adapter_dp.rb