# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Mixmatic::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => 'dshipper',
  :password       => 'Gremlin5!',
  :domain         => 'heroku.com'
}

ActionMailer::Base.delivery_method = :smtp