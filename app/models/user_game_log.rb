# frozen_string_literal: true

class UserGameLog < ApplicationRecord
  enum result: {
      win: 1,
      lose: 2,
      draw: 3
    }
end
