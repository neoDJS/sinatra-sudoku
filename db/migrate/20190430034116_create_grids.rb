class CreateGrids < ActiveRecord::Migration
  def change
    create_table :grids do |t|
      t.belongs_to :user # t.references :user, foreign_key: true, index: true
      t.integer :complexity, default: 0
      t.timestamps null: false
    end
  end
end
