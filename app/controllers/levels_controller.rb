class LevelsController < ApplicationController
   before_filter :authorize
  def index
    @levels = Level.all
  end

  def new
    @level = Level.new
  end

  def edit
    @level = Level.find(params[:id])
  end

  def create
    @level = Level.new(params[:level])
      if @level.save
        flash[:notice] = 'Level was successfully created.'
        redirect_to levels_url
      else
        render :action => "new"
    end
  end

  def update
    @level = Level.find(params[:id])
      if @level.update_attributes(params[:level])
        flash[:notice] = 'Level was successfully updated.'
        redirect_to levels_url
      else
        render :action => "edit"
    end
  end

  def destroy
    @level = Level.find(params[:id])
    @level.destroy
    flash[:notice] = 'Level was successfully updated.'
   redirect_to levels_url
  end
end
