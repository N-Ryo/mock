class CreateHacks < ActiveRecord::Migration[5.1]
  def change
    create_table :hacks do |t|
      t.references :category_role_relationship, foreign_key: true
      t.references :comment, foreign_key: true

      t.timestamps
    end
  end
end
