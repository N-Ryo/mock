class CreateCategoryRoleRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :category_role_relationships do |t|
      t.references :category, foreign_key: true
      t.references :role, foreign_key: true

      t.timestamps
    end
  end
end
