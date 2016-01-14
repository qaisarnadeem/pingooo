class AddAttachmentPictureCompetitionPictureToGamePictures < ActiveRecord::Migration
  def self.up
    change_table :game_pictures do |t|
      t.attachment :picture
      t.attachment :competition_picture
    end
  end

  def self.down
    remove_attachment :game_pictures, :picture
    remove_attachment :game_pictures, :competition_picture
  end
end
