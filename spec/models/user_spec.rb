require 'spec_helper'

describe User do
  before(:each) do
    @valid_attributes = {
      :email => "kev@hotmail.com",
      :password => "123456",
      :password_confirmation => "123456"
    }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@valid_attributes)
  end
end
