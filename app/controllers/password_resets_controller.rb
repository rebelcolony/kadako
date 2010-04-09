class PasswordResetsController < ApplicationController
    before_filter :load_user_using_perishable_token, :only => [ :edit, :update ]

    def new
    end

    def create
      @user = User.find_by_email(params[:email])
      if @user
        Notifications.deliver_password_reset_instructions!

        flash[:notice] = "Instructions to reset your password have been emailed to you"

        redirect_to root_path
      else
        flash[:error] = "No user was found with that email address"

        render :action => :new
      end
    end

    def edit
    end

    def update
      @user.password = params[:password]
      if @user.save
        flash[:success] = "Password successfully updated"

        redirect_to @user
      else
        render :action => :edit
      end
    end


    private

    def load_user_using_perishable_token
      @user = User.find_using_perishable_token(params[:id])
      unless @user
        flash[:error] = "We're sorry, but we could not locate your account"

        redirect_to root_url
      end
    end
  
end
