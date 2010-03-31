class SessionsController < ApplicationController
  def new
  end

  def create
    session[:password] = params[:password]
      if
        session[:password] == "kadadmin"
        flash[:notice] = "Successfully logged in"
        redirect_to root_url
      else
		    flash[:error] = "Password is incorrect, please try again"
		    redirect_to(:controller => 'sessions', :action => 'new')
      end
  end
    
  def destroy
    reset_session
    flash[:notice] = "Successfully logged out, bye!"
    redirect_to root_url
  end

end
