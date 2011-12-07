require 'spec_helper'

describe "finds/show.html.haml" do
  before(:each) do
    @find = assign(:find, stub_model(Find))
  end

  it "renders attributes in <p>" do
    render
  end
end
