require 'spec_helper'

describe Category do
  before(:each) do
    @valid_attributes = {
      :name => "value for name"
    }
  end

  it "should create a new instance given valid attributes" do
    Category.create!(@valid_attributes)
  end
  
  it "should fail when name is missing" do
    @valid_attributes.delete(:name)
    lambda { @category = Category.create!(@valid_attributes) }.should raise_error(ActiveRecord::RecordInvalid)
  end
end
