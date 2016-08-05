class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
    	t.integer :game_id, null: false
    	t.integer :user_id, null: false
    	t.decimal :start_amount, precision: 8, scale: 2, null: false
    	t.decimal :end_amount, precision: 8, scale: 2, null: false
    	t.integer :months, null: false

      t.timestamps
    end
  end
end
