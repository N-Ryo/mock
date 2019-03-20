class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :feeling
      t.string :content
      t.integer :point, default: 0
      t.references :user, foreign_key: true
      t.references :hack, foreign_key: true

      t.timestamps
    end
    add_index :comments, [:user_id, :created_at]
  end
end
