class Notifications < ActionMailer::Base
  
  default_url_options[:host] = "kadako.com" 
  
  
  def contact(email_params)
      subject "[KADAKO Contact Form] " << email_params[:subject]
      recipients "kevin.bett@gmail.com, daniel.greyling@kadako.com"
      from email_params[:email]
      sent_on Time.now.utc
      body :message => email_params[:body], 
      :name => email_params[:name],
      :email => email_params[:email]
    end
  
    def registration_confirmation(email_params)
      subject "[KADAKO] A new cadidate has signed up"
      recipients "kevin.bett@gmail.com, daniel.greyling@kadako.com"
      body  :email => email_params[:email]
    end
    
    
    def password_reset_instructions(user)
        subject       "Password Reset Instructions"
        from          "noreplay@kadako.com"
        recipients    user.email
        sent_on       Time.now
        body          :edit_password_reset_url => edit_password_reset_url(user.perishable_token)
      end
    

end
