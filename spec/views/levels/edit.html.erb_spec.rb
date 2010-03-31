require 'spec_helper'

describe "/levels/edit.html.erb" do
  include LevelsHelper

  before(:each) do
    assigns[:level] = @level = stub_model(Level,
      :new_record? => false,
      :level => "value for level"
    )
  end

  it "renders the edit level form" do
    render

    response.should have_tag("form[action=#{level_path(@level)}][method=post]") do
      with_tag('input#level_level[name=?]', "level[level]")
    end
  end
end
