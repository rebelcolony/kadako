require 'spec_helper'

describe UserSession do
  before(:each) do
    
    
    @valid_attributes = {
      :email => "kevin@hotmail.com",
      :password => "123456"
    }
  end

  it "should create a new instance given valid attributes" do
    UserSession.create!(@valid_attributes)
  end
end
