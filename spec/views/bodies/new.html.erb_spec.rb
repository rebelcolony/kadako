require 'spec_helper'

describe "/bodies/new.html.erb" do
  include BodiesHelper

  before(:each) do
    assigns[:body] = stub_model(Body,
      :new_record? => true,
      :name => "value for name"
    )
  end

  it "renders new body form" do
    render

    response.should have_tag("form[action=?][method=post]", bodies_path) do
      with_tag("input#body_name[name=?]", "body[name]")
    end
  end
end
