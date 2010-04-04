class Notifications < ActionMailer::Base
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

end
