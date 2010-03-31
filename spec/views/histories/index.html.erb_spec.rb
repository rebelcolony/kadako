require 'spec_helper'

describe "/histories/index.html.erb" do
  include HistoriesHelper

  before(:each) do
    assigns[:histories] = [
      stub_model(History,
        :description => "value for description",
        :equipment => "value for equipment",
        :company => "value for company",
        :position => "value for position"
      ),
      stub_model(History,
        :description => "value for description",
        :equipment => "value for equipment",
        :company => "value for company",
        :position => "value for position"
      )
    ]
  end

  it "renders a list of histories" do
    render
    response.should have_tag("tr>td", "value for description".to_s, 2)
    response.should have_tag("tr>td", "value for equipment".to_s, 2)
    response.should have_tag("tr>td", "value for company".to_s, 2)
    response.should have_tag("tr>td", "value for position".to_s, 2)
  end
end
