require 'spec_helper'

describe History do
   before(:each) do
  
  @user = mock_model(User)
  @user.stub!(:destroyed?).and_return false
  
  @sector = mock_model(Sector)
  @sector.stub!(:destroyed?).and_return false
  
    @valid_attributes = {
      :sector => @sector,
      :user => @user,
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
  
  it "should fail when sector is missing" do
    @valid_attributes.delete(:sector)
    lambda { @history = History.create!(@valid_attributes) }.should raise_error(ActiveRecord::RecordInvalid)
  end
  
  it "should fail when start date is missing" do
    @valid_attributes.delete(:start)
    lambda { @history = History.create!(@valid_attributes) }.should raise_error(ActiveRecord::RecordInvalid)
  end
  
  it "should fail when end date is missing" do
    @valid_attributes.delete(:end)
    lambda { @history = History.create!(@valid_attributes) }.should raise_error(ActiveRecord::RecordInvalid)
  end
  
  it "should fail when description is missing" do
    @valid_attributes.delete(:description)
    lambda { @history = History.create!(@valid_attributes) }.should raise_error(ActiveRecord::RecordInvalid)
  end
  
  it "should fail when equipment is missing" do
    @valid_attributes.delete(:equipment)
    lambda { @history = History.create!(@valid_attributes) }.should raise_error(ActiveRecord::RecordInvalid)
  end
  
  it "should fail when company is missing" do
    @valid_attributes.delete(:company)
    lambda { @history = History.create!(@valid_attributes) }.should raise_error(ActiveRecord::RecordInvalid)
  end
  
  it "should fail when position is missing" do
    @valid_attributes.delete(:position)
    lambda { @history = History.create!(@valid_attributes) }.should raise_error(ActiveRecord::RecordInvalid)
  end
  
end
