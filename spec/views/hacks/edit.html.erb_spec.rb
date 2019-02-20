require 'rails_helper'

RSpec.describe "hacks/edit", type: :view do
  before(:each) do
    @hack = assign(:hack, Hack.create!(
      :category_role_relationship => nil,
      :comment => nil
    ))
  end

  it "renders the edit hack form" do
    render

    assert_select "form[action=?][method=?]", hack_path(@hack), "post" do

      assert_select "input[name=?]", "hack[category_role_relationship_id]"

      assert_select "input[name=?]", "hack[comment_id]"
    end
  end
end
