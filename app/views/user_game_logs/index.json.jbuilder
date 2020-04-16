# frozen_string_literal: true

json.array! @user_game_logs, partial: 'user_game_logs/user_game_log', as: :user_game_log
