require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SearchesController do
  
  describe "get INDEX" do
    
    it "should get with status 200" do
      get :index
      assert_response :success, @response.body
    end
    
    it "should find all users with an ALL / ALL search" do
      get :index, :body => 'all', :technique => 'all'
      assert_response :success, @response.body
    end
    
    it "should find users in a certain body" do
      get :index, :body => '1', :technique => 'all'
      assert_response :success, @response.body
    end
    
    it "should find users with a certain technique" do
      get :index, :body => 'all', :technique => '1'
      assert_response :success, @response.body
    end
    
    it "should find users with a technique and a body" do
      get :index, :body => '1', :technique => '1'
      assert_response :success, @response.body
    end
    
  end
  
end