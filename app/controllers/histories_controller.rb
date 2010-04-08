class HistoriesController < ApplicationController
  before_filter :get_user


  def show
    @history = @user.histories.find(params[:id])
  end

  def new
    @history = @user.histories.new
  end

  def edit
    @history = History.find(params[:id])
  end

  def create
    @history = @user.histories.create(params[:history])
      if @history.save
        flash[:notice] = 'History was successfully created.'
        redirect_to @user
      else
        render :action => "new"
      end
  end

  def update
    @history = @user.histories.find(params[:id])
      if @history.update_attributes(params[:history])
        flash[:notice] = 'History was successfully updated.'
        redirect_to @user
      else
        render :action => "edit"
    end
  end


  def destroy
    @history = History.find(params[:id])
    @history.destroy
    flash[:notice] = 'History was successfully updated.'
    redirect_to @user
  end
end
