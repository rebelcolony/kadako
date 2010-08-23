class IndustriesController < ApplicationController
   before_filter :authorize
  def index
    @industries = Industry.all
  end

  def show
    @industry = Industry.find(params[:id])
  end

  def new
    @industry = Industry.new
  end

  def edit
    @industry = Industry.find(params[:id])
  end

  def create
    @industry = Industry.new(params[:industry])
      if @industry.save
        redirect_to(@industry, :notice => 'Industry was successfully created.')
      else
        render :action => "new"
    end
  end

  def update
    @industry = Industry.find(params[:id])
      if @industry.update_attributes(params[:industry])
        redirect_to(@industry, :notice => 'Industry was successfully updated.')
      else
        render :action => "edit" 
    end
  end

  def destroy
    @industry = Industry.find(params[:id])
    @industry.destroy
    redirect_to(@industry, :notice => 'Industry was successfully destroyed.')
  end
end
