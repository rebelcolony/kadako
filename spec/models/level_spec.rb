require 'spec_helper'

describe Level do
  before(:each) do
    @valid_attributes = {
      :level => "value for level"
    }
  end

  it "should create a new instance given valid attributes" do
    Level.create!(@valid_attributes)
  end
end
