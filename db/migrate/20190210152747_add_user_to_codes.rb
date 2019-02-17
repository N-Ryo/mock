class AddUserToCodes < ActiveRecord::Migration[5.1]
  def change
    add_reference :codes, :hack, foreign_key: true
    add_reference :codes, :user, foreign_key: true 
  end
  add_index :codes, [:user_id, :created_at]
end
