require 'rails_helper'

RSpec.describe "codes/new", type: :view do
  before(:each) do
    assign(:code, Code.new())
  end

  it "renders new code form" do
    render

    assert_select "form[action=?][method=?]", codes_path, "post" do
    end
  end
end
