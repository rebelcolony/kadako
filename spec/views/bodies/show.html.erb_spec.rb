require 'spec_helper'

describe "/bodies/show.html.erb" do
  include BodiesHelper
  before(:each) do
    assigns[:body] = @body = stub_model(Body,
      :name => "value for name"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
  end
end
