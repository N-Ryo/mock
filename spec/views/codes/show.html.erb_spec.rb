require 'rails_helper'

RSpec.describe "codes/show", type: :view do
  before(:each) do
    @code = assign(:code, Code.create!(
      :content => "Content",
      :tag => "Tag"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Content/)
    expect(rendered).to match(/Tag/)
  end
end
