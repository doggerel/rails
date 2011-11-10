require "spec_helper"

describe SpidersController do
  describe "routing" do

    it "routes to #index" do
      get("/spiders").should route_to("spiders#index")
    end

    it "routes to #new" do
      get("/spiders/new").should route_to("spiders#new")
    end

    it "routes to #show" do
      get("/spiders/1").should route_to("spiders#show", :id => "1")
    end

    it "routes to #edit" do
      get("/spiders/1/edit").should route_to("spiders#edit", :id => "1")
    end

    it "routes to #create" do
      post("/spiders").should route_to("spiders#create")
    end

    it "routes to #update" do
      put("/spiders/1").should route_to("spiders#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/spiders/1").should route_to("spiders#destroy", :id => "1")
    end

  end
end
