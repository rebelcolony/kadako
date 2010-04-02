require 'spec_helper'

describe "/sectors/show.html.erb" do
  include SectorsHelper
  before(:each) do
    assigns[:sector] = @sector = stub_model(Sector,
      :name => "value for name"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
  end
end
