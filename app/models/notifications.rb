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
  
    def registration_confirmation(user)
      recipients   user.email
      from         "no-reply@kadako.com"
      subject      "Thanks for Registering with Kadako"
      body         :user => user
      content_type "text/html"
    end

end
