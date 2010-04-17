class CategoriesController < ApplicationController
  before_filter :authorize
  
  def index
    @categories = Category.find(:all, :order => "name ASC")
  end


  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(params[:category])
      if @category.save
        flash[:notice] = 'Category was successfully created.'
        redirect_to(categories_url)
      else
      render :action => "new"
    end
  end

  def update
    @category = Category.find(params[:id])
      if @category.update_attributes(params[:category])
        flash[:notice] = 'Category was successfully updated.'
        redirect_to(categories_url)
      else
        render :action => "edit"
      end
  end


  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = 'Category was successfully destroyed.'
      redirect_to(categories_url)
  end
end
