class AddGamePictureToGame < ActiveRecord::Migration
  def change
    add_reference :game_pictures, :game, index: true, foreign_key: true
  end
end
