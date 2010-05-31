class SearchesController < ApplicationController
  
  def index
    if params[:body] && params[:technique]
      @body = params[:body].to_i if params[:body].present?
      @technique = params[:technique].to_i if params[:technique].present?
      @users = Search.find(@body, @technique)
    end
  end
  
end
