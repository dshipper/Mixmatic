class UserMailer < ActionMailer::Base
  default from: "dan@danshipper.com"
  
  def you_got_mix (sender_name, recipient_name, link, email)
     @name = sender_name
     @person = recipient_name    
     @link = link     
     subject = ""
     mail(:to => email, 
          :subject => subject)  
   end
end
