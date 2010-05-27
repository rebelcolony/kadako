require 'spec_helper'

describe Qualification do
  before(:each) do
    
    @user = mock_model(User)
    @user.stub!(:destroyed?).and_return false
    
    @body = mock_model(Body)
    @body.stub!(:destroyed?).and_return false
    
    @category = mock_model(Category)
    @category.stub!(:destroyed?).and_return false
    
    @technique = mock_model(Technique)
    @technique.stub!(:destroyed?).and_return false
    
    @level = mock_model(Level)
    @level.stub!(:destroyed?).and_return false
    
    @valid_attributes = {
      :user => @user,
      :body => @body,
      :category => @category,
      :technique => @technique,
      :level => @level,
      :expire_date => Date.today
    }
  end

  it "should create a new instance given valid attributes" do
    Qualification.create!(@valid_attributes)
  end
  
  it "should fail when user is missing" do
    @valid_attributes.delete(:user)
    lambda { @qualification = Qualification.create!(@valid_attributes) }.should raise_error(ActiveRecord::RecordInvalid)
  end
  
  it "should fail when body is missing" do
    @valid_attributes.delete(:body)
    lambda { @qualification = Qualification.create!(@valid_attributes) }.should raise_error(ActiveRecord::RecordInvalid)
  end
  
  it "should fail when category is missing" do
    @valid_attributes.delete(:category)
    lambda { @qualification = Qualification.create!(@valid_attributes) }.should raise_error(ActiveRecord::RecordInvalid)
  end
  
  it "should fail when technique is missing" do
    @valid_attributes.delete(:technique)
    lambda { @qualification = Qualification.create!(@valid_attributes) }.should raise_error(ActiveRecord::RecordInvalid)
  end
  
  it "should fail when body is missing" do
    @valid_attributes.delete(:level)
    lambda { @qualification = Qualification.create!(@valid_attributes) }.should raise_error(ActiveRecord::RecordInvalid)
  end
  
  
  
end
