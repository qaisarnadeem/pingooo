class CreateGamePictures < ActiveRecord::Migration
  def change
    create_table :game_pictures do |t|
      t.boolean :is_used,:default=>false
      t.timestamps null: false
    end
  end
end
