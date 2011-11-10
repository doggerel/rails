require 'spec_helper'

describe "news/show.html.erb" do
  before(:each) do
    @news = assign(:news, stub_model(News))
  end

  it "renders attributes in <p>" do
    render
  end
end
