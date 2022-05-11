require 'rails_helper'

RSpec.describe "photos/index", type: :view do
  before(:each) do
    assign(:photos, [
      Photo.create!(
        img: "Img",
        user: nil,
        folder: nil
      ),
      Photo.create!(
        img: "Img",
        user: nil,
        folder: nil
      )
    ])
  end

  it "renders a list of photos" do
    render
    assert_select "tr>td", text: "Img".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
