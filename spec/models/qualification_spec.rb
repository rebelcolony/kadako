require 'spec_helper'

describe Qualification do
  before(:each) do
    @valid_attributes = {
      :expire_date => Date.today
    }
  end

  it "should create a new instance given valid attributes" do
    Qualification.create!(@valid_attributes)
  end
end
