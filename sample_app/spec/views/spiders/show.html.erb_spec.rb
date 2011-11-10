require 'spec_helper'

describe "spiders/show.html.erb" do
  before(:each) do
    @spider = assign(:spider, stub_model(Spider))
  end

  it "renders attributes in <p>" do
    render
  end
end
