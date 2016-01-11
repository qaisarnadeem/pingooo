class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.integer :position_x
      t.integer :position_y
      t.integer :position_offset
      t.integer :number_of_winner,:default=>0
      t.integer :status

      t.timestamps null: false
    end
  end
end
