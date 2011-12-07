require 'spec_helper'

describe "finds/edit.html.haml" do
  before(:each) do
    @find = assign(:find, stub_model(Find))
  end

  it "renders the edit find form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => finds_path(@find), :method => "post" do
    end
  end
end
