class CreateHacks < ActiveRecord::Migration[5.1]
  def change
    create_table :hacks do |t|
      t.text :overview
      t.references :category, foreign_key: true
      t.references :role, foreign_key: true
      t.integer :point, default: 0

      t.timestamps
    end
  end
end
