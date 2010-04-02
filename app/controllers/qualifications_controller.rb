class QualificationsController < ApplicationController
   before_filter :get_user
  def show
    @qualification = @user.qualifications.find(params[:id])
  end

  def new
    @qualification = @user.qualifications.new
  end

  def edit
    @qualification = current_user
  end

  def create
    @qualification = @user.qualifications.create(params[:qualification])
      if @qualification.save
        flash[:notice] = 'Qualification was successfully created.'
        redirect_to current_user
      else
        render :action => "new"
      end
  end

  def update
    @qualification = current_user
      if @qualification.update_attributes(params[:qualification])
        flash[:notice] = 'Qualification was successfully updated.'
        redirect_to current_user
      else
        render :action => "edit"
      end
  end

  def destroy
    @qualification = Qualification.find(params[:id])
    @qualification.destroy
    flash[:notice] = 'Qualification was successfully destroyed.'
    redirect_to current_user
  end
end
