require 'spec_helper'

describe "spiders/new.html.erb" do
  before(:each) do
    assign(:spider, stub_model(Spider).as_new_record)
  end

  it "renders new spider form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => spiders_path, :method => "post" do
    end
  end
end
