FactoryBot.define do
  factory :user_game_log do
    player1_user_id { 1 }
    player2_user_id { 1 }
    result { 1 }
    player1_before_rate { 1.5 }
    player1_after_rate { 1.5 }
    player2_before_rate { 1.5 }
    player2_after_rate { 1.5 }
    first_player { false }
    kifu { "" }
    rule { 1 }
  end
end
