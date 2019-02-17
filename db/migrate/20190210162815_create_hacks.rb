class CreateHacks < ActiveRecord::Migration[5.1]
  def change
    create_table :hacks do |t|
      t.string :category
      t.string :subcategory

      t.timestamps
    end
  end
end
