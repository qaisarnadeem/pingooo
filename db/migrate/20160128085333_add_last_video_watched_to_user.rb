class AddLastVideoWatchedToUser < ActiveRecord::Migration
  def change
    add_column :users, :last_video_watched, :datetime
  end
end
