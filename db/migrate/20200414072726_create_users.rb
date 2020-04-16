# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.float :rateing
      t.integer :win
      t.integer :lose
      t.integer :draw
      t.integer :successive_win
      t.float :rating_first
      t.float :rating_second
      t.float :rating_deviation
      t.float :rating_volatility
      t.datetime :last_played_at

      t.timestamps
    end
  end
end
