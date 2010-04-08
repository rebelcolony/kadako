class SectorsController < ApplicationController
  before_filter :authorize
  def index
    @sectors = Sector.all
  end

  def show
    @sector = Sector.find(params[:id])
  end

  def new
    @sector = Sector.new
  end

  def edit
    @sector = Sector.find(params[:id])
  end

  def create
    @sector = Sector.new(params[:sector])
      if @sector.save
        flash[:notice] = 'Sector was successfully created.'
        redirect_to sectors_url
      else
        render :action => "new" 
      end
  end

  def update
    @sector = Sector.find(params[:id])
      if @sector.update_attributes(params[:sector])
        flash[:notice] = 'Sector was successfully updated.'
        redirect_to sectors_url
      else
        render :action => "edit"
      end
  end

  def destroy
    @sector = Sector.find(params[:id])
    @sector.destroy
    flash[:notice] = 'Sector was successfully destored.'
       redirect_to sectors_url
    end
end
