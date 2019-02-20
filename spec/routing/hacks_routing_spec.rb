require "rails_helper"

RSpec.describe HacksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/hacks").to route_to("hacks#index")
    end

    it "routes to #new" do
      expect(:get => "/hacks/new").to route_to("hacks#new")
    end

    it "routes to #show" do
      expect(:get => "/hacks/1").to route_to("hacks#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/hacks/1/edit").to route_to("hacks#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/hacks").to route_to("hacks#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/hacks/1").to route_to("hacks#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/hacks/1").to route_to("hacks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/hacks/1").to route_to("hacks#destroy", :id => "1")
    end
  end
end
