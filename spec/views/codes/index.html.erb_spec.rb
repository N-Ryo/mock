require 'rails_helper'

RSpec.describe "codes/index", type: :view do
  before(:each) do
    assign(:codes, [
      Code.create!(
        :content => "Content",
        :tag => "Tag"
      ),
      Code.create!(
        :content => "Content",
        :tag => "Tag"
      )
    ])
  end

  it "renders a list of codes" do
    render
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    assert_select "tr>td", :text => "Tag".to_s, :count => 2
  end
end
