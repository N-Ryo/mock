class AddUserToCodes < ActiveRecord::Migration[5.1]
  def change
    add_reference :hacks, foreign_key: true
    add_reference :users, foreign_key: true 
  end
  add_index :codes, [:user_id, :created_at]
end
