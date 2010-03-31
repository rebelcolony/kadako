require 'spec_helper'

describe "/levels/index.html.erb" do
  include LevelsHelper

  before(:each) do
    assigns[:levels] = [
      stub_model(Level,
        :level => "value for level"
      ),
      stub_model(Level,
        :level => "value for level"
      )
    ]
  end

  it "renders a list of levels" do
    render
    response.should have_tag("tr>td", "value for level".to_s, 2)
  end
end
