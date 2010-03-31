class ProfilesController < ApplicationController

  def index
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def create
    @profile = current_user.profile.build params[:profile]
    if @profile.save
        flash[:notice] = 'Profile was successfully created.'
        redirect_to(@profile)
      else
        render :action => "new"
      end
  end

  def update
    @profile = Profile.find(params[:id])
      if @profile.update_attributes(params[:profile])
        flash[:notice] = 'Profile was successfully updated.'
        redirect_to(@profile)
      else
        render :action => "edit"
      end
  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
    redirect_to(profiles_url)
  end
end
