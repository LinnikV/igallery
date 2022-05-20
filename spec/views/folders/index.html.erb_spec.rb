# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'folders/index', type: :view do
  before(:each) do
    assign(:folders, [
             Folder.create!,
             Folder.create!
           ])
  end

  it 'renders a list of folders' do
    render
  end
end
