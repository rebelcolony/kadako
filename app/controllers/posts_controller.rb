class PostsController < ApplicationController

  def new
    @post = Post.new
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def create
    @post = Post.new(params[:post])
    if @post.save
        flash[:notice] = 'Post was successfully created.'
        redirect_to root_url
      else
      render :action => "new"
    end
  end

  def update
    @post = Post.find(params[:id])
      if @post.update_attributes(params[:post])
        flash[:notice] = 'Post was successfully updated.'
        redirect_to root_url
      else
        render :action => "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'Post was successfully destroyed.'
    redirect_to root_url
  end
  
end
