# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user_game_logs/edit', type: :view do
  before(:each) do
    @user_game_log = assign(:user_game_log, UserGameLog.create!(
                                              player1_user_id: 1,
                                              player2_user_id: 1,
                                              result: 1,
                                              player1_before_rate: 1.5,
                                              player1_after_rate: 1.5,
                                              player2_before_rate: 1.5,
                                              player2_after_rate: 1.5,
                                              first_player: false,
                                              kifu: '',
                                              rule: 1
                                            ))
  end

  it 'renders the edit user_game_log form' do
    render

    assert_select 'form[action=?][method=?]', user_game_log_path(@user_game_log), 'post' do
      assert_select 'input[name=?]', 'user_game_log[player1_user_id]'

      assert_select 'input[name=?]', 'user_game_log[player2_user_id]'

      assert_select 'input[name=?]', 'user_game_log[result]'

      assert_select 'input[name=?]', 'user_game_log[player1_before_rate]'

      assert_select 'input[name=?]', 'user_game_log[player1_after_rate]'

      assert_select 'input[name=?]', 'user_game_log[player2_before_rate]'

      assert_select 'input[name=?]', 'user_game_log[player2_after_rate]'

      assert_select 'input[name=?]', 'user_game_log[first_player]'

      assert_select 'input[name=?]', 'user_game_log[kifu]'

      assert_select 'input[name=?]', 'user_game_log[rule]'
    end
  end
end
