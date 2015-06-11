require "rails_helper"

RSpec.describe SolvedExamsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/solved_exams").to route_to("solved_exams#index")
    end

    it "routes to #new" do
      expect(:get => "/solved_exams/new").to route_to("solved_exams#new")
    end

    it "routes to #show" do
      expect(:get => "/solved_exams/1").to route_to("solved_exams#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/solved_exams/1/edit").to route_to("solved_exams#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/solved_exams").to route_to("solved_exams#create")
    end

    it "routes to #update" do
      expect(:put => "/solved_exams/1").to route_to("solved_exams#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/solved_exams/1").to route_to("solved_exams#destroy", :id => "1")
    end

  end
end