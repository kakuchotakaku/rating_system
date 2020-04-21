# frozen_string_literal: true

json.extract! user, :id, :name, :rating, :win, :lose, :draw, :successive_win, :rating_first, :rating_second, :rating_deviation, :rating_volatility, :last_played_at, :created_at, :updated_at
json.url user_url(user, format: :json)
