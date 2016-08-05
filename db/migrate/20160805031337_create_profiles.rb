class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
    	t.integer :user_id, null: false
    	t.decimal :financial_goal, precision: 8, scale: 2, null: false
    	t.decimal :current_balance, precision: 8, scale: 2, null: false
    	t.boolean :active, default: true

      t.timestamps
    end
  end
end
