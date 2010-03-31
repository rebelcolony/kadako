require 'spec_helper'

describe "/techniques/new.html.erb" do
  include TechniquesHelper

  before(:each) do
    assigns[:technique] = stub_model(Technique,
      :new_record? => true,
      :name => "value for name"
    )
  end

  it "renders new technique form" do
    render

    response.should have_tag("form[action=?][method=post]", techniques_path) do
      with_tag("input#technique_name[name=?]", "technique[name]")
    end
  end
end
