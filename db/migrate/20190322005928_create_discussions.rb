class CreateDiscussions < ActiveRecord::Migration[5.1]
  def change
    create_table :discussions do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.references :comment, foreign_key: true
      t.integer :discussion_id, foreign_key: true

      t.timestamps
    end
  end
end
