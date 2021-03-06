# frozen_string_literal: true

class UserGameLog < ApplicationRecord
  validates :player1_user_id, presence: true
  validates :player2_user_id, presence: true
  validates :result, presence: true
  validate :check_same_user

  enum result: {
    win: 1,
    lose: 2,
    draw: 3
  }

  # enum first_player: {first_player: 1, second_player: 0}

  def check_same_user
    if player1_user_id == player2_user_id
      errors.add(:player1_user_id, '同一ユーザーを選択しています')
    end
  end
end
