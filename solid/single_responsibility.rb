# class InvoiceMailer
#   def initialize(order)
#     @order = order
#   end
#   def generate_report
#     # Used order object to generate report
#   end
#   def send_mail
#     # send email to @order.user
#   end
# end

# InvoiceMailer.new(order).generate_report
# InvoiceMailer.new(order).send_mail

class InvoiceReport
   def initialize(order)
     @order = order
   end
   def generate
     # Used order object to generate report
   end
 end
 
 class InvoiceMailer
   def initialize(order, report)
     @order = order
     @report = report
   end
   def send_mail
     # send email to @order.user
   end
 end
 
 report = InvoiceReport.new(order).generate
 InvoiceMailer.new(order, report)

#  Here, we have a class called InvoiceMailer, and within it, we carry out two distinct functions, 
#  the first is to generate reports and the second is send email to users. 
#  As mailer is the name of the class, it shouldn’t perform tasks that are not meant for it.

# According to the single responsibility concept, each class, module, method, etc. 
# should only be responsible for one aspect of a program’s functionality. In order to separate them out.