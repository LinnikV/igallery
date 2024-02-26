# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'photos/index', type: :view do
  before(:each) do
    assign(:photos, [
             Photo.create!(
               image: 'Image',
               category: nil,
               user: nil
             ),
             Photo.create!(
               image: 'Image',
               category: nil,
               user: nil
             )
           ])
  end

  it 'renders a list of photos' do
    render
    assert_select 'tr>td', text: 'Image'.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
  end
end
