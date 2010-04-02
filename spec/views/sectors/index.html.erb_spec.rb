require 'spec_helper'

describe "/sectors/index.html.erb" do
  include SectorsHelper

  before(:each) do
    assigns[:sectors] = [
      stub_model(Sector,
        :name => "value for name"
      ),
      stub_model(Sector,
        :name => "value for name"
      )
    ]
  end

  it "renders a list of sectors" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
  end
end
