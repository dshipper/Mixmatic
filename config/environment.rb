# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Mixmatic::Application.initialize!

config.action_mailer.delivery_method = :smtp

ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
   :port           => '587',
   :authentication => :plain,
   :user_name      => ENV['dshipper'],
   :password       => ENV['Gremlin5!'],
   :domain         => 'heroku.com'
}

config.action_mailer.raise_delivery_errors = true
