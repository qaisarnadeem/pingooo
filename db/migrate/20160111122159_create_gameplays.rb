class CreateGameplays < ActiveRecord::Migration
  def change
    create_table :gameplays do |t|
      t.integer :postion_x
      t.integer :position_y
      t.references :game, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :chance_number
      t.boolean :is_hit,:default=>false

      t.timestamps null: false
    end
  end
end
