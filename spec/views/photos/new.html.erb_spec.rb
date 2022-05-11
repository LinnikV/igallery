require 'rails_helper'

RSpec.describe "photos/new", type: :view do
  before(:each) do
    assign(:photo, Photo.new(
      img: "MyString",
      user: nil,
      folder: nil
    ))
  end

  it "renders new photo form" do
    render

    assert_select "form[action=?][method=?]", photos_path, "post" do

      assert_select "input[name=?]", "photo[img]"

      assert_select "input[name=?]", "photo[user_id]"

      assert_select "input[name=?]", "photo[folder_id]"
    end
  end
end
