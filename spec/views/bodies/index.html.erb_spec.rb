require 'spec_helper'

describe "/bodies/index.html.erb" do
  include BodiesHelper

  before(:each) do
    assigns[:bodies] = [
      stub_model(Body,
        :name => "value for name"
      ),
      stub_model(Body,
        :name => "value for name"
      )
    ]
  end

  it "renders a list of bodies" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
  end
end
