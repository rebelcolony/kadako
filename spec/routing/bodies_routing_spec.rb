require 'spec_helper'

describe BodiesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/bodies" }.should route_to(:controller => "bodies", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/bodies/new" }.should route_to(:controller => "bodies", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/bodies/1" }.should route_to(:controller => "bodies", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/bodies/1/edit" }.should route_to(:controller => "bodies", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/bodies" }.should route_to(:controller => "bodies", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/bodies/1" }.should route_to(:controller => "bodies", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/bodies/1" }.should route_to(:controller => "bodies", :action => "destroy", :id => "1") 
    end
  end
end
