# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'photos/new', type: :view do
  before(:each) do
    assign(:photo, Photo.new(
                     image: 'MyString',
                     category: nil,
                     user: nil
                   ))
  end

  it 'renders new photo form' do
    render

    assert_select 'form[action=?][method=?]', photos_path, 'post' do
      assert_select 'input[name=?]', 'photo[image]'

      assert_select 'input[name=?]', 'photo[category_id]'

      assert_select 'input[name=?]', 'photo[user_id]'
    end
  end
end
