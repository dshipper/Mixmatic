class UserMailer < ActionMailer::Base
  default from: "no-reply@mixmatic.co"
  
  def you_got_mix (sender_name, recipient_name, link, email)
     @name = sender_name
     @person = recipient_name    
     @link = link     
     subject = @name + " created you a mixtape with Mixmatic"
     mail(:to => email, 
          :subject => subject)  
   end
end
