require 'spec_helper'

describe "/sectors/new.html.erb" do
  include SectorsHelper

  before(:each) do
    assigns[:sector] = stub_model(Sector,
      :new_record? => true,
      :name => "value for name"
    )
  end

  it "renders new sector form" do
    render

    response.should have_tag("form[action=?][method=post]", sectors_path) do
      with_tag("input#sector_name[name=?]", "sector[name]")
    end
  end
end
