class UserSessionsController < ApplicationController
 def new
  @user_session = UserSession.new
 end
 
 def create
  @user_session = UserSession.new(params[:user_session])
  if @user_session.save
    flash[:notice] = "Sucessfully logged in"
    redirect_to current_user
  else
    render :action => "new"
  end
 end
 
 def destroy
  @user_session = UserSession.find
  @user_session.destroy
  flash[:notice] = "Sucessfully logged out"
  redirect_to root_url
  
 end
 
end
