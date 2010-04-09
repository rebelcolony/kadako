class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  helper_method :current_user
  helper_method :admin?

  protected

  def authorize
    unless admin? or current_user
      flash[:error] = "Unathorized access"
      redirect_to(:controller => "info", :action => "index")
    end
  end
  

  def admin?
    session[:password] == "kadadmin"
  end

  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  def get_user
    @user = User.find params[:user_id]
  end

end
