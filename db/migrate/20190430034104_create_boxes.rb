class CreateBoxes < ActiveRecord::Migration
  def change
    create_table :boxes do |t|
      t.integer :bloc
      t.integer :line
      t.integer :column
      t.integer :value
      t.string :creator, default: "User"
      t.integer :grid_id
      t.timestamps null: false
    end
  end
end
