class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.float :rate
      t.integer :win
      t.integer :lose
      t.integer :draw
      t.integer :successive_win
      t.float :rate_first
      t.float :rate_second

      t.timestamps
    end
  end
end
