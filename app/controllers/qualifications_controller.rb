class QualificationsController < ApplicationController
   
  def show
    @qualification = Qualification.find(params[:id])
  end

  def new
    @qualification = Qualification.new
  end

  def edit
    @qualification = Qualification.find(params[:id])
  end

  def create
    @qualification = Qualification.create(params[:qualification])
      if @qualification.save
        flash[:notice] = 'Qualification was successfully created.'
        redirect_to current_user
      else
        render :action => "new"
      end
  end

  def update
    @qualification = Qualification.find(params[:id])
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
