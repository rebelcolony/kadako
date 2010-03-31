require 'spec_helper'

describe "/qualifications/new.html.erb" do
  include QualificationsHelper

  before(:each) do
    assigns[:qualification] = stub_model(Qualification,
      :new_record? => true
    )
  end

  it "renders new qualification form" do
    render

    response.should have_tag("form[action=?][method=post]", qualifications_path) do
    end
  end
end
