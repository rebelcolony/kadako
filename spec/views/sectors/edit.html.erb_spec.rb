require 'spec_helper'

describe "/sectors/edit.html.erb" do
  include SectorsHelper

  before(:each) do
    assigns[:sector] = @sector = stub_model(Sector,
      :new_record? => false,
      :name => "value for name"
    )
  end

  it "renders the edit sector form" do
    render

    response.should have_tag("form[action=#{sector_path(@sector)}][method=post]") do
      with_tag('input#sector_name[name=?]', "sector[name]")
    end
  end
end
