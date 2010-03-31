require 'spec_helper'

describe "/histories/show.html.erb" do
  include HistoriesHelper
  before(:each) do
    assigns[:history] = @history = stub_model(History,
      :description => "value for description",
      :equipment => "value for equipment",
      :company => "value for company",
      :position => "value for position"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ description/)
    response.should have_text(/value\ for\ equipment/)
    response.should have_text(/value\ for\ company/)
    response.should have_text(/value\ for\ position/)
  end
end
