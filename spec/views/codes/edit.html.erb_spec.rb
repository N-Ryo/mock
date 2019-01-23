require 'rails_helper'

RSpec.describe "codes/edit", type: :view do
  before(:each) do
    @code = assign(:code, Code.create!())
  end

  it "renders the edit code form" do
    render

    assert_select "form[action=?][method=?]", code_path(@code), "post" do
    end
  end
end
