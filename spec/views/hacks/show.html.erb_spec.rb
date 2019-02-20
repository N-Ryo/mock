require 'rails_helper'

RSpec.describe "hacks/show", type: :view do
  before(:each) do
    @hack = assign(:hack, Hack.create!(
      :category_role_relationship => nil,
      :comment => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
