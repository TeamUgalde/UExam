require "rails_helper"

RSpec.describe ItemAnswersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/item_answers").to route_to("item_answers#index")
    end

    it "routes to #new" do
      expect(:get => "/item_answers/new").to route_to("item_answers#new")
    end

    it "routes to #show" do
      expect(:get => "/item_answers/1").to route_to("item_answers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/item_answers/1/edit").to route_to("item_answers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/item_answers").to route_to("item_answers#create")
    end

    it "routes to #update" do
      expect(:put => "/item_answers/1").to route_to("item_answers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/item_answers/1").to route_to("item_answers#destroy", :id => "1")
    end

  end
end