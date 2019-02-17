class CreateCodes < ActiveRecord::Migration[5.1]
  def change
    create_table :codes do |t|
      t.text :content
      t.string :tag

      t.timestamps
    end
    add_index :codes, [:user_id, :created_at]
  end
end
