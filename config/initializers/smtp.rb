# ActionMailer::Base.smtp_settings = {
#   address: "smtp.gmail.com",
#   port: 587,
#   domain: 'gmail.com',
#   user_name: ENV['GMAIL_ADDRESS'],
#   password: ENV['GMAIL_APP_PASSWORD'],
#   authentication: :login,
#   enable_starttls_auto: true
# }

ActionMailer::Base.smtp_settings = {
  :port           => ENV['MAILGUN_SMTP_PORT'],
  :address        => ENV['MAILGUN_SMTP_SERVER'],
  :user_name      => ENV['MAILGUN_SMTP_LOGIN'],
  :password       => ENV['MAILGUN_SMTP_PASSWORD'],
  :domain         => 'sandboxbe11a479d2ae419c912170012a67562c.mailgun.org',
  :authentication => :plain,
}
ActionMailer::Base.delivery_method = :smtp
