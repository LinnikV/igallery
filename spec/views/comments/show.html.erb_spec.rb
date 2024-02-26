# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'comments/show', type: :view do
  before(:each) do
    @comment = assign(:comment, Comment.create!(
                                  body: 'MyText',
                                  photo: nil,
                                  user: nil
                                ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
