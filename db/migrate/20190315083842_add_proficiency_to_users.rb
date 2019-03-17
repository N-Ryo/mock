class AddProficiencyToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :proficiency, :integer
  end
end
