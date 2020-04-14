json.extract! user_game_log, :id, :player1_user_id, :player2_user_id, :result, :player1_before_rate, :player1_after_rate, :player2_before_rate, :player2_after_rate, :first_player, :kifu, :rule, :created_at, :updated_at
json.url user_game_log_url(user_game_log, format: :json)
