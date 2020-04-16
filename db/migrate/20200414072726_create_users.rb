# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.float :rating, default: 1500
      t.integer :win, default: 0
      t.integer :lose, default: 0
      t.integer :draw, default: 0
      t.integer :successive_win, default: 0
      t.float :rating_first, default: 1500
      t.float :rating_second, default: 1500
      t.float :rating_deviation, default: 350
      t.float :rating_volatility, default: 0.06
      t.datetime :last_played_at

      t.timestamps
    end
  end
end
