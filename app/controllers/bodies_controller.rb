class BodiesController < ApplicationController
  before_filter :authorize

  def index
    @bodies = Body.find(:all, :order => "name ASC")
  end
  
  def new
    @body = Body.new
  end
  
  def edit
    @body = Body.find(params[:id])
  end

  def create
    @body = Body.new(params[:body])
      if @body.save
        flash[:notice] = 'Body was successfully created.'
        redirect_to(bodies_url)
      else
        render :action => "new"
    end
  end

  def update
    @body = Body.find(params[:id])
      if @body.update_attributes(params[:body])
        flash[:notice] = 'Body was successfully updated.'
        redirect_to(bodies_url)
      else
        render :action => "edit"
    end
  end

  def destroy
    @body = Body.find(params[:id])
    @body.destroy
    flash[:notice] = 'Body was successfully destroyed.'
     redirect_to(bodies_url)
  end
end
