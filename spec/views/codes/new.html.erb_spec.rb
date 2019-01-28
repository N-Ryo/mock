require 'rails_helper'

RSpec.describe "codes/new", type: :view do
  before(:each) do
    assign(:code, Code.new(
      :content => "MyString",
      :tag => "MyString"
    ))
  end

  it "renders new code form" do
    render

    assert_select "form[action=?][method=?]", codes_path, "post" do

      assert_select "input[name=?]", "code[content]"

      assert_select "input[name=?]", "code[tag]"
    end
  end
end
