class AddTitleToCodes < ActiveRecord::Migration[5.1]
  def change
    add_column :codes, :title, :integer
  end
end
