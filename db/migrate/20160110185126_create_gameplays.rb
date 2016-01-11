class CreateGameplays < ActiveRecord::Migration
  def change
    create_table :gameplays do |t|
      t.integer :position_x
      t.integer :position_y
      t.references :game
      t.references :user
      t.integer :chance_number 
      t.boolean :is_hit 
      t.timestamps null: false
    end
  end
end
