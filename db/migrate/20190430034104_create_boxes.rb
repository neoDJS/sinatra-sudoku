class CreateBoxes < ActiveRecord::Migration
  def change
    create_table :boxes do |t|
      t.string :line
      t.string :column
      t.string :value
      t.string :creator
      t.integer :grid_id
      t.timestamps null: false
    end
  end
end
