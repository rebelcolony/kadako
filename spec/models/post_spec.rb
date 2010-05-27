require 'spec_helper'

describe Post do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :body => "value for body"
    }
  end

  it "should create a new instance given valid attributes" do
    Post.create!(@valid_attributes)
  end
  
  it "should fail when title is missing" do
    @valid_attributes.delete(:title)
    lambda { @post = Post.create!(@valid_attributes) }.should raise_error(ActiveRecord::RecordInvalid)
  end
  
  it "should fail when body is missing" do
    @valid_attributes.delete(:body)
    lambda { @post = Post.create!(@valid_attributes) }.should raise_error(ActiveRecord::RecordInvalid)
  end
end
