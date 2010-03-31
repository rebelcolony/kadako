require 'spec_helper'

describe TechniquesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/techniques" }.should route_to(:controller => "techniques", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/techniques/new" }.should route_to(:controller => "techniques", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/techniques/1" }.should route_to(:controller => "techniques", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/techniques/1/edit" }.should route_to(:controller => "techniques", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/techniques" }.should route_to(:controller => "techniques", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/techniques/1" }.should route_to(:controller => "techniques", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/techniques/1" }.should route_to(:controller => "techniques", :action => "destroy", :id => "1") 
    end
  end
end
