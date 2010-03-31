require 'spec_helper'

describe "/qualifications/show.html.erb" do
  include QualificationsHelper
  before(:each) do
    assigns[:qualification] = @qualification = stub_model(Qualification)
  end

  it "renders attributes in <p>" do
    render
  end
end
