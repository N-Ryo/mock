class CreateCodes < ActiveRecord::Migration[5.1]
  def change
    create_table :codes do |t|

      t.timestamps
    end
  end
end
