require 'rails_helper'

RSpec.describe "hacks/index", type: :view do
  before(:each) do
    assign(:hacks, [
      Hack.create!(
        :category_role_relationship => nil,
        :comment => nil
      ),
      Hack.create!(
        :category_role_relationship => nil,
        :comment => nil
      )
    ])
  end

  it "renders a list of hacks" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
