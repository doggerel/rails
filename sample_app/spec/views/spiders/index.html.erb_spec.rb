require 'spec_helper'

describe "spiders/index.html.erb" do
  before(:each) do
    assign(:spiders, [
      stub_model(Spider),
      stub_model(Spider)
    ])
  end

  it "renders a list of spiders" do
    render
  end
end
