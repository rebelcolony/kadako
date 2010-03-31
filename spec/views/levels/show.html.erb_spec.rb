require 'spec_helper'

describe "/levels/show.html.erb" do
  include LevelsHelper
  before(:each) do
    assigns[:level] = @level = stub_model(Level,
      :level => "value for level"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ level/)
  end
end
