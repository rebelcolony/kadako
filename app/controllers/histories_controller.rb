class HistoriesController < ApplicationController


  def show
    @history = History.find(params[:id])
  end

  def new
    @history = History.new
  end

  def edit
    @history = History.find(params[:id])
  end

  def create
    @history = History.create(params[:history])
      if @history.save
        flash[:notice] = 'History was successfully created.'
        redirect_to root_url
      else
        render :action => "new"
      end
  end

  def update
    @history = History.find(params[:id])
      if @history.update_attributes(params[:history])
        flash[:notice] = 'History was successfully updated.'
        redirect_to root_url
      else
        render :action => "edit"
    end
  end


  def destroy
    @history = History.find(params[:id])
    @history.destroy
    flash[:notice] = 'History was successfully updated.'
    redirect_to root_url
  end
end
