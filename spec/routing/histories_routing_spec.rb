require 'spec_helper'

describe HistoriesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/histories" }.should route_to(:controller => "histories", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/histories/new" }.should route_to(:controller => "histories", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/histories/1" }.should route_to(:controller => "histories", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/histories/1/edit" }.should route_to(:controller => "histories", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/histories" }.should route_to(:controller => "histories", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/histories/1" }.should route_to(:controller => "histories", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/histories/1" }.should route_to(:controller => "histories", :action => "destroy", :id => "1") 
    end
  end
end
