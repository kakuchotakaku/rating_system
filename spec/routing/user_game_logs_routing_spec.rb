require "rails_helper"

RSpec.describe UserGameLogsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/user_game_logs").to route_to("user_game_logs#index")
    end

    it "routes to #new" do
      expect(:get => "/user_game_logs/new").to route_to("user_game_logs#new")
    end

    it "routes to #show" do
      expect(:get => "/user_game_logs/1").to route_to("user_game_logs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/user_game_logs/1/edit").to route_to("user_game_logs#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/user_game_logs").to route_to("user_game_logs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/user_game_logs/1").to route_to("user_game_logs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/user_game_logs/1").to route_to("user_game_logs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/user_game_logs/1").to route_to("user_game_logs#destroy", :id => "1")
    end
  end
end
