class AddAttachmentPictureCompetitionPictureToGames < ActiveRecord::Migration
  def self.up
    change_table :games do |t|
      t.attachment :picture
      t.attachment :competition_picture
    end
  end

  def self.down
    remove_attachment :games, :picture
    remove_attachment :games, :competition_picture
  end
end
