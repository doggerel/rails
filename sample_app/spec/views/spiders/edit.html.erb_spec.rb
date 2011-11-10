require 'spec_helper'

describe "spiders/edit.html.erb" do
  before(:each) do
    @spider = assign(:spider, stub_model(Spider))
  end

  it "renders the edit spider form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => spiders_path(@spider), :method => "post" do
    end
  end
end
