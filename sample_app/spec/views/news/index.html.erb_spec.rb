require 'spec_helper'

describe "news/index.html.erb" do
  before(:each) do
    assign(:news, [
      stub_model(News),
      stub_model(News)
    ])
  end

  it "renders a list of news" do
    render
  end
end
