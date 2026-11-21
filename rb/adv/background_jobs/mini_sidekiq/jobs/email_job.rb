# jobs/email_job.rb
class EmailJob
  def perform(user_email)
    puts "Sending email to #{user_email}..."

    # simulate failure randomly
    raise "SMTP Error" if rand < 0.3

    sleep 1
    puts "Email sent to #{user_email}"
  end
end
