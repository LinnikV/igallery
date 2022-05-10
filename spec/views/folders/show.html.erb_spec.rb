require 'rails_helper'

RSpec.describe "folders/show", type: :view do
  before(:each) do
    @folder = assign(:folder, Folder.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
