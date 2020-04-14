json.extract! user, :id, :name, :rate, :win, :lose, :draw, :successive_win, :rate_first, :rate_second, :created_at, :updated_at
json.url user_url(user, format: :json)
