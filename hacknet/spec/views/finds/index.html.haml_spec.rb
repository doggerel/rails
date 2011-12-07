require 'spec_helper'

describe "finds/index.html.haml" do
  before(:each) do
    assign(:finds, [
      stub_model(Find),
      stub_model(Find)
    ])
  end

  it "renders a list of finds" do
    render
  end
end
