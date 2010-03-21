require 'spec_helper'

describe "/users/new.html.erb" do
  include UsersHelper

  before(:each) do
    assigns[:user] = stub_model(User,
      :new_record? => true,
      :email => "value for email",
      :password => "value for password"
    )
  end

  it "renders new user form" do
    render

    response.should have_tag("form[action=?][method=post]", users_path) do
      with_tag("input#user_email[name=?]", "user[email]")
      with_tag("input#user_password[name=?]", "user[password]")
    end
  end
end
