# class InvoiceReport
#   def initialize(order, type)
#     @order = order
#     @type = type
#   end

#   def generate
#     case @type
#     when :csv
#      # Generate CSV report
#     when :pdf
#      # Generate PDF report
#     else
#      raise NotImplementedError
#     end
#   end
# end

# report = InvoiceReport.new(order, :pdf).generate


class InvoiceReport
  def initialize(order, klass)
   @order = order
   @klass = klass
  end

  def generate
   @klass.new(@order).generate
  end
end

class PdfGenerator
  def initialize(order)
   @order = order
  end

  def generate
   # Generate PDF Report
  end
end

class CsvGenerator
  def initialize(order)
   @order = order
  end

  def generate
   # Generate CSV Report
  end
end
 
 report_pdf = InvoiceReport.new(order, PdfGenerator).generate
 report_csv = InvoiceReport.new(order, CsvGenerator).generate



# Software entities such as classes, modules, methods, etc should be open for extension but close for modification

# This principal’s primary goal is to design the code’s architecture in such a way that functionality 
# can be extended rather than modified or refactored.