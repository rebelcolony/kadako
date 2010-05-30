require 'spec_helper'

describe SearchesController do
  
  describe "get INDEX" do
    it "should get with status 200" do
      get :index
      assert_response :success, @response.body
    end
  end
  
end