class UsersController < ApplicationController

  before_filter :current_or_find_user, :only => [:edit, :update]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])
    if @user.save
      flash[:notice] = "Registration successfull"
      Notifications.deliver_registration_confirmation(@user)
      redirect_to root_url
    else
      render :action => "new"
    end
  end


  # Using current_user from admin doesnt work
  # you could do something like below, if you want to avoid another controller.
  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = "Your account details have been successfully updated"
      redirect_to(@user)
    else
      render :action => "edit"
    end
  end


  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = 'User was successfully destroyed.'
    redirect_to root_url
  end

  private

  def current_or_find_user
    if admin?
      @user = User.find params[:id]
    else
      @user = current_user
    end
  end

end
