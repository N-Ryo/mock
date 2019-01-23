require 'rails_helper'

RSpec.describe "codes/show", type: :view do
  before(:each) do
    @code = assign(:code, Code.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
