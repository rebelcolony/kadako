class Notifications < ActionMailer::Base
  def contact(email_params)
      subject "[KADAKO Contact Form] " << email_params[:subject]
      recipients "kevin.bett@gmail.com" # Replace with your address
      from email_params[:email]
      sent_on Time.now.utc

      body :message => email_params[:body], 
      :name => email_params[:name],
      :email => email_params[:email]
    end
  

end
