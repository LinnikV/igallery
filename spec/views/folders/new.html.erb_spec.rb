require 'rails_helper'

RSpec.describe "folders/new", type: :view do
  before(:each) do
    assign(:folder, Folder.new())
  end

  it "renders new folder form" do
    render

    assert_select "form[action=?][method=?]", folders_path, "post" do
    end
  end
end
