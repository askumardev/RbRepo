# ruby solid/single_responsibility.rb

class User
  attr_reader :name, :email

  def initialize(name, email)
    @name = name
    @email = email
  end
end

class UserRepository
  def save(user)
    puts "Saving #{user.name} to DB"
  end
end

class UserMailer
  def send_email(user)
    puts "Sending email to #{user.email}"
  end
end

#  Here, we have a class called InvoiceMailer, and within it, we carry out two distinct functions,
#  the first is to generate reports and the second is send email to users.
#  As mailer is the name of the class, it shouldn’t perform tasks that are not meant for it.

# According to the single responsibility concept, each class, module, method, etc.
# should only be responsible for one aspect of a program’s functionality. In order to separate them out.
