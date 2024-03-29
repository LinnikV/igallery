# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'photos/show', type: :view do
  before(:each) do
    @photo = assign(:photo, Photo.create!(
                              image: 'Image',
                              category: nil,
                              user: nil
                            ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Image/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
