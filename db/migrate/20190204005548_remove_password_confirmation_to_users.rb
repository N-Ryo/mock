class RemovePasswordConfirmationToUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :passward_confirmation, :string
  end
end
