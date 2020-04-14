require 'rails_helper'

RSpec.describe "user_game_logs/new", type: :view do
  before(:each) do
    assign(:user_game_log, UserGameLog.new(
      :player1_user_id => 1,
      :player2_user_id => 1,
      :result => 1,
      :player1_before_rate => 1.5,
      :player1_after_rate => 1.5,
      :player2_before_rate => 1.5,
      :player2_after_rate => 1.5,
      :first_player => false,
      :kifu => "",
      :rule => 1
    ))
  end

  it "renders new user_game_log form" do
    render

    assert_select "form[action=?][method=?]", user_game_logs_path, "post" do

      assert_select "input[name=?]", "user_game_log[player1_user_id]"

      assert_select "input[name=?]", "user_game_log[player2_user_id]"

      assert_select "input[name=?]", "user_game_log[result]"

      assert_select "input[name=?]", "user_game_log[player1_before_rate]"

      assert_select "input[name=?]", "user_game_log[player1_after_rate]"

      assert_select "input[name=?]", "user_game_log[player2_before_rate]"

      assert_select "input[name=?]", "user_game_log[player2_after_rate]"

      assert_select "input[name=?]", "user_game_log[first_player]"

      assert_select "input[name=?]", "user_game_log[kifu]"

      assert_select "input[name=?]", "user_game_log[rule]"
    end
  end
end
