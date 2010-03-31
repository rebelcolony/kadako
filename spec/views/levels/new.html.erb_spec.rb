require 'spec_helper'

describe "/levels/new.html.erb" do
  include LevelsHelper

  before(:each) do
    assigns[:level] = stub_model(Level,
      :new_record? => true,
      :level => "value for level"
    )
  end

  it "renders new level form" do
    render

    response.should have_tag("form[action=?][method=post]", levels_path) do
      with_tag("input#level_level[name=?]", "level[level]")
    end
  end
end
