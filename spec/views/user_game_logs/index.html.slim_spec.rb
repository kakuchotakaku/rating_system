# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user_game_logs/index', type: :view do
  before(:each) do
    assign(:user_game_logs, [
             UserGameLog.create!(
               player1_user_id: 2,
               player2_user_id: 3,
               result: 4,
               player1_before_rate: 5.5,
               player1_after_rate: 6.5,
               player2_before_rate: 7.5,
               player2_after_rate: 8.5,
               first_player: false,
               kifu: '',
               rule: 9
             ),
             UserGameLog.create!(
               player1_user_id: 2,
               player2_user_id: 3,
               result: 4,
               player1_before_rate: 5.5,
               player1_after_rate: 6.5,
               player2_before_rate: 7.5,
               player2_after_rate: 8.5,
               first_player: false,
               kifu: '',
               rule: 9
             )
           ])
  end

  it 'renders a list of user_game_logs' do
    render
    assert_select 'tr>td', text: 2.to_s, count: 2
    assert_select 'tr>td', text: 3.to_s, count: 2
    assert_select 'tr>td', text: 4.to_s, count: 2
    assert_select 'tr>td', text: 5.5.to_s, count: 2
    assert_select 'tr>td', text: 6.5.to_s, count: 2
    assert_select 'tr>td', text: 7.5.to_s, count: 2
    assert_select 'tr>td', text: 8.5.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
    assert_select 'tr>td', text: ''.to_s, count: 2
    assert_select 'tr>td', text: 9.to_s, count: 2
  end
end
