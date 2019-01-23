require 'rails_helper'

RSpec.describe "codes/index", type: :view do
  before(:each) do
    assign(:codes, [
      Code.create!(),
      Code.create!()
    ])
  end

  it "renders a list of codes" do
    render
  end
end
