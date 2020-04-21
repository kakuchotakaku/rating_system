# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, presence: true
  def won
    self.win += 1
    self.successive_win += 1
  end

  def lost
    self.lose += 1
    self.successive_win = 0
  end

  def drew
    self.draw += 1
    self.successive_win = 0
  end
end
