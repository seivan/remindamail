ActionMailer::Base.smtp_settings = {
  :address              => "smtp.sendgrid.com",
  :port                 => 587,
  :domain               => "railscasts.com",
  :user_name            => "railscasts",
  :password             => "secret",
  :authentication       => "plain",
  :enable_starttls_auto => true
}

# ActionMailer::Base.smtp_settings = {
#   :address              => "smtp.gmail.com",
#   :port                 => 587,
#   :domain               => "railscasts.com",
#   :user_name            => "railscasts",
#   :password             => "secret",
#   :authentication       => "plain",
#   :enable_starttls_auto => true
# }