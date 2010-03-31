require 'spec_helper'

describe "/techniques/edit.html.erb" do
  include TechniquesHelper

  before(:each) do
    assigns[:technique] = @technique = stub_model(Technique,
      :new_record? => false,
      :name => "value for name"
    )
  end

  it "renders the edit technique form" do
    render

    response.should have_tag("form[action=#{technique_path(@technique)}][method=post]") do
      with_tag('input#technique_name[name=?]', "technique[name]")
    end
  end
end
