class ChangeTransactionColumn < ActiveRecord::Migration[5.0]
  def change
  	rename_column :transactions, :user_id, :profile_id
  end
end
