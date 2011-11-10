require 'spec_helper'

describe "news/new.html.erb" do
  before(:each) do
    assign(:news, stub_model(News).as_new_record)
  end

  it "renders new news form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => news_index_path, :method => "post" do
    end
  end
end
