require 'spec_helper'

describe "/qualifications/edit.html.erb" do
  include QualificationsHelper

  before(:each) do
    assigns[:qualification] = @qualification = stub_model(Qualification,
      :new_record? => false
    )
  end

  it "renders the edit qualification form" do
    render

    response.should have_tag("form[action=#{qualification_path(@qualification)}][method=post]") do
    end
  end
end
