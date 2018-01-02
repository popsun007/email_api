Rails.application.config.action_mailer.smtp_settings = {
  :user_name =>      ENV['GMAIL_USERNAME'],
  :password =>       ENV['GMAIL_PASSWORD'],
  :domain =>         ENV['MAIL_HOST'],
  :address =>       'smtp.gmail.com',
  :port =>          587,
  :authentication =>  "plain",
  :enable_starttls_auto => true
}
