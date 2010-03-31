class UsersController < ApplicationController

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
      redirect_to root_url
    else
      render :action => "new"
    end
 end
 
 def edit
   @user = current_user 
 end
 
 def update
   @user = current_user
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
    redirect_to(@user)
  end
 
end
