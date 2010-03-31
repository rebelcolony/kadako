class TechniquesController < ApplicationController
  before_filter :authorize
  
  def index
    @techniques = Technique.all
  end

  def new
    @technique = Technique.new
  end

  def edit
    @technique = Technique.find(params[:id])
  end

  def create
    @technique = Technique.new(params[:technique])
      if @technique.save
        flash[:notice] = 'Technique was successfully created.'
        redirect_to(techniques_url)
      else
        render :action => "new"
      end
  end
  
  def update
    @technique = Technique.find(params[:id])

      if @technique.update_attributes(params[:technique])
        flash[:notice] = 'Technique was successfully updated.'
        redirect_to(techniques_url)
      else
        render :action => "edit"
    end
  end
  
  def destroy
    @technique = Technique.find(params[:id])
    @technique.destroy
    flash[:notice] = 'Technique was successfully destroyed.'
    redirect_to(techniques_url)
  end
end
