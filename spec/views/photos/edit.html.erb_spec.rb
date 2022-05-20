# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'photos/edit', type: :view do
  before(:each) do
    @photo = assign(:photo, Photo.create!(
                              image: 'MyString',
                              user: nil,
                              folder: nil
                            ))
  end

  it 'renders the edit photo form' do
    render

    assert_select 'form[action=?][method=?]', photo_path(@photo), 'post' do
      assert_select 'input[name=?]', 'photo[image]'

      assert_select 'input[name=?]', 'photo[user_id]'

      assert_select 'input[name=?]', 'photo[folder_id]'
    end
  end
end
