class InfoController < ApplicationController
  def index
    @posts = Post.find(:all, :order => 'created_at DESC', :limit => 3)
  end

  def terms
  end
  
end
