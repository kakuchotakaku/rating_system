class CreateUserGameLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :user_game_logs do |t|
      t.integer :player1_user_id
      t.integer :player2_user_id
      t.integer :result
      t.float :player1_before_rate
      t.float :player1_after_rate
      t.float :player2_before_rate
      t.float :player2_after_rate
      t.boolean :first_player
      t.text :kifu
      t.integer :rule

      t.timestamps
    end
  end
end
