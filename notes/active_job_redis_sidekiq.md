# 🚀 Background Jobs in Rails (Simple Steps)

## ✅ Step 1: Create a Job

```bash
rails generate job SendEmail
```
✅ Step 2: Write Job Logic

Open:
```
app/jobs/send_email_job.rb
class SendEmailJob < ApplicationJob
  def perform(user)
    puts "Sending email to #{user.email}"
  end
end
```
✅ Step 3: Call the Job

From controller / console:

SendEmailJob.perform_later(user)

👉 That’s it — job goes to background ✅

⚙️ Step 4: Set Adapter

Open:

config/application.rb

For now (simple):

config.active_job.queue_adapter = :async

✔ No setup needed
✔ Works immediately

▶️ Step 5: Run Server
rails server

Now trigger the job → check terminal output 🎉

🔥 That’s the Minimum Working Setup
🧠 What’s happening (1 line)

👉 perform_later → puts job in queue → Rails runs it in background

🚀 When you’re ready (Production Setup)

Use Sidekiq:

Install
bundle add sidekiq
Configure
config.active_job.queue_adapter = :sidekiq
Start
bundle exec sidekiq
🔥 Quick Comparison
Method	Behavior
perform_now	Runs immediately ❌
perform_later	Runs in background ✅
💡 Super Simple Example
# controller
SendEmailJob.perform_later(user)

👉 User doesn’t wait 🚀

🧠 Final Summary
Generate job
Write perform method
Call perform_later
Done ✅