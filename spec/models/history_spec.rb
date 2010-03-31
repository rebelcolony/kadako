require 'spec_helper'

describe History do
  before(:each) do
    @valid_attributes = {
      :start => Date.today,
      :end => Date.today,
      :description => "value for description",
      :equipment => "value for equipment",
      :company => "value for company",
      :position => "value for position"
    }
  end

  it "should create a new instance given valid attributes" do
    History.create!(@valid_attributes)
  end
end
