# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user_game_logs/show', type: :view do
  before(:each) do
    @user_game_log = assign(:user_game_log, UserGameLog.create!(
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
                                            ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5.5/)
    expect(rendered).to match(/6.5/)
    expect(rendered).to match(/7.5/)
    expect(rendered).to match(/8.5/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
    expect(rendered).to match(/9/)
  end
end
