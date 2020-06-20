# frozen_string_literal: true

Rails.application.routes.draw do
  resources :user_game_logs
  resources :users
  post 'user_game_logs/preview', to: 'user_game_logs#preview'
  post 'users/preview', to: 'users#preview'
  root 'top#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
