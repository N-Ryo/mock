class AddUserToCodes < ActiveRecord::Migration[5.1]
  def change
    add_reference :hack, foreign_key: true
    add_reference :user, foreign_key: true 
  end
  add_index :codes, [:user_id, :created_at]
end
