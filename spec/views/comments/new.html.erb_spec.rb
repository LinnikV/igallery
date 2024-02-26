# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'comments/new', type: :view do
  before(:each) do
    assign(:comment, Comment.new(
                       body: 'MyText',
                       photo: nil,
                       user: nil
                     ))
  end

  it 'renders new comment form' do
    render

    assert_select 'form[action=?][method=?]', comments_path, 'post' do
      assert_select 'textarea[name=?]', 'comment[body]'

      assert_select 'input[name=?]', 'comment[photo_id]'

      assert_select 'input[name=?]', 'comment[user_id]'
    end
  end
end
