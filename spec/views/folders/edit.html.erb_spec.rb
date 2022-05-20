# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'folders/edit', type: :view do
  before(:each) do
    @folder = assign(:folder, Folder.create!)
  end

  it 'renders the edit folder form' do
    render

    assert_select 'form[action=?][method=?]', folder_path(@folder), 'post' do
    end
  end
end
