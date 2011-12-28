class UserMailer < ActionMailer::Base
  default from: "no-reply@mixmatic.co"
  
  def you_got_mix (sender_name, recipient_name, link, email, mix_name)
     @name = sender_name
     @person = recipient_name    
     @link = link    
     @mix_name = mix_name 
     subject = @name + " created a mixtape for you with Mixmatic"
     mail(:to => email, 
          :subject => subject)  
   end
end
