require "spec_helper"

describe FindsController do
  describe "routing" do

    it "routes to #index" do
      get("/finds").should route_to("finds#index")
    end

    it "routes to #new" do
      get("/finds/new").should route_to("finds#new")
    end

    it "routes to #show" do
      get("/finds/1").should route_to("finds#show", :id => "1")
    end

    it "routes to #edit" do
      get("/finds/1/edit").should route_to("finds#edit", :id => "1")
    end

    it "routes to #create" do
      post("/finds").should route_to("finds#create")
    end

    it "routes to #update" do
      put("/finds/1").should route_to("finds#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/finds/1").should route_to("finds#destroy", :id => "1")
    end

  end
end
