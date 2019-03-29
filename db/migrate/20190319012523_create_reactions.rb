class CreateReactions < ActiveRecord::Migration[5.1]
  def change
    create_table :reactions do |t|
      t.references :comment, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :evaluation

      t.timestamps
    end
    add_index :reactions, [:user_id, :comment_id], unique: true
  end
end
