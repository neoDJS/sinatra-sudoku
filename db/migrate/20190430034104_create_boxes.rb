class CreateBoxes < ActiveRecord::Migration
  def change
    create_table :boxes do |t|
      t.integer :bloc
      t.integer :line
      t.integer :column
      t.integer :value
      t.string :creator, default: "User"
      t.belongs_to :grid # t.references :grid, foreign_key: true, index: true
      t.timestamps null: false
    end
  end
end
