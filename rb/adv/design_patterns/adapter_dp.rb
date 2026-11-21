# The Adapter pattern allows the interface of an existing class to be used as another interface.
# It is often used to make existing classes work with others without modifying their source code.

# Old class with incompatible interface
class OldPrinter
  def print_old(text)
    puts "Old Printing: #{text}"
  end
end

# New expected interface
class NewPrinter
  def print(text)
    puts "New Printing: #{text}"
  end
end

# Adapter converts OldPrinter interface to match NewPrinter
class PrinterAdapter
  def initialize(old_printer)
    @old_printer = old_printer
  end

  def print(text)
    @old_printer.print_old(text)
  end
end

# Using old printer through adapter
old_printer = OldPrinter.new
adapter = PrinterAdapter.new(old_printer)

adapter.print("Hello, World!")
# Output: Printing: Hello, World!

# Using new printer directly (no adapter needed)
new_printer = NewPrinter.new
new_printer.print("Hello, World!....")
# Output: New Printing: Hello, World!....


# ruby design_patterns/adapter_dp.rb
