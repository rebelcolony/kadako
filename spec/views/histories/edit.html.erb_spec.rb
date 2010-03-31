require 'spec_helper'

describe "/histories/edit.html.erb" do
  include HistoriesHelper

  before(:each) do
    assigns[:history] = @history = stub_model(History,
      :new_record? => false,
      :description => "value for description",
      :equipment => "value for equipment",
      :company => "value for company",
      :position => "value for position"
    )
  end

  it "renders the edit history form" do
    render

    response.should have_tag("form[action=#{history_path(@history)}][method=post]") do
      with_tag('textarea#history_description[name=?]', "history[description]")
      with_tag('textarea#history_equipment[name=?]', "history[equipment]")
      with_tag('input#history_company[name=?]', "history[company]")
      with_tag('input#history_position[name=?]', "history[position]")
    end
  end
end
