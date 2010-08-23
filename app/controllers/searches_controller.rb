class SearchesController < ApplicationController
  
  def index
    body = Body.exists?(params[:body].to_i) ? Body.find(params[:body].to_i) : nil
    technique = Technique.exists?(params[:technique].to_i) ? Technique.find(params[:technique].to_i) : nil
    @users = Qualification.search(body, technique)
    
    @body = params[:body].to_i if params[:body] != 'all'
    @technique = params[:technique].to_i if params[:technique] != 'all'
  end  
end
