class CreateReactions < ActiveRecord::Migration[5.1]
  def change
    create_table :reactions do |t|
      t.references :comment, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :evaluation

      t.timestamps
    end
  end
end
