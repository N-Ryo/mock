class CreateUserCategoryRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :user_category_relationships do |t|
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
    add_index :user_category_relationships, [:user_id, :category_id], unique: true
  end
end
