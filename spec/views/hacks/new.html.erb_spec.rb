require 'rails_helper'

RSpec.describe "hacks/new", type: :view do
  before(:each) do
    assign(:hack, Hack.new(
      :category_role_relationship => nil,
      :comment => nil
    ))
  end

  it "renders new hack form" do
    render

    assert_select "form[action=?][method=?]", hacks_path, "post" do

      assert_select "input[name=?]", "hack[category_role_relationship_id]"

      assert_select "input[name=?]", "hack[comment_id]"
    end
  end
end
