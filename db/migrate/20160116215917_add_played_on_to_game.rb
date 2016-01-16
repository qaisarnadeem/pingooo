class AddPlayedOnToGame < ActiveRecord::Migration
  def change
    add_column :games, :played_on, :datetime
  end
end
