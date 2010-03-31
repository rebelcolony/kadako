require 'spec_helper'

describe "/techniques/show.html.erb" do
  include TechniquesHelper
  before(:each) do
    assigns[:technique] = @technique = stub_model(Technique,
      :name => "value for name"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
  end
end
