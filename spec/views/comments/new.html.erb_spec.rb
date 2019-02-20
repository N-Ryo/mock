require 'rails_helper'

RSpec.describe "comments/new", type: :view do
  before(:each) do
    assign(:comment, Comment.new(
      :feeling => 1,
      :content => "MyString",
      :user => nil
    ))
  end

  it "renders new comment form" do
    render

    assert_select "form[action=?][method=?]", comments_path, "post" do

      assert_select "input[name=?]", "comment[feeling]"

      assert_select "input[name=?]", "comment[content]"

      assert_select "input[name=?]", "comment[user_id]"
    end
  end
end
