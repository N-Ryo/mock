class AddColumnToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :website_url, :text
    add_column :users, :organization, :text
    add_column :users, :location, :text
    add_column :users, :description, :text
  end
end
