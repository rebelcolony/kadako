require 'spec_helper'

describe "/techniques/index.html.erb" do
  include TechniquesHelper

  before(:each) do
    assigns[:techniques] = [
      stub_model(Technique,
        :name => "value for name"
      ),
      stub_model(Technique,
        :name => "value for name"
      )
    ]
  end

  it "renders a list of techniques" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
  end
end
