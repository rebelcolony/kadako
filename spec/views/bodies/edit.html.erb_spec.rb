require 'spec_helper'

describe "/bodies/edit.html.erb" do
  include BodiesHelper

  before(:each) do
    assigns[:body] = @body = stub_model(Body,
      :new_record? => false,
      :name => "value for name"
    )
  end

  it "renders the edit body form" do
    render

    response.should have_tag("form[action=#{body_path(@body)}][method=post]") do
      with_tag('input#body_name[name=?]', "body[name]")
    end
  end
end
