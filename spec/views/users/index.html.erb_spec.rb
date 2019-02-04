require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :name => "Name",
        :email => "Email",
        :password => "Password",
        :password_confirmation => "Password Confirmation"
      ),
      User.create!(
        :name => "Name",
        :email => "Email",
        :password => "Password",
        :password_confirmation => "Password Confirmation"
      )
    ])
  end
=begin
  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Password Digest".to_s, :count => 2
  end
=end
end
