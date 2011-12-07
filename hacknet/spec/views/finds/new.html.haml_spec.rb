require 'spec_helper'

describe "finds/new.html.haml" do
  before(:each) do
    assign(:find, stub_model(Find).as_new_record)
  end

  it "renders new find form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => finds_path, :method => "post" do
    end
  end
end
