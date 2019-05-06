class CreateGrids < ActiveRecord::Migration
  def change
    create_table :grids do |t|
      t.integer :user_id
      t.integer :complexity, default: 0
      t.timestamps null: false
    end
  end
end
