# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_200_414_073_006) do
  create_table 'user_game_logs', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.integer 'player1_user_id'
    t.integer 'player2_user_id'
    t.integer 'result'
    t.float 'player1_before_rate'
    t.float 'player1_after_rate'
    t.float 'player2_before_rate'
    t.float 'player2_after_rate'
    t.boolean 'first_player'
    t.text 'kifu'
    t.integer 'rule'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'users', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'name', null: false
    t.float 'rating', default: 1500.0
    t.integer 'win', default: 0
    t.integer 'lose', default: 0
    t.integer 'draw', default: 0
    t.integer 'successive_win', default: 0
    t.float 'rating_first', default: 1500.0
    t.float 'rating_second', default: 1500.0
    t.float 'rating_deviation', default: 350.0
    t.float 'rating_volatility', default: 0.06
    t.datetime 'last_played_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end
end
