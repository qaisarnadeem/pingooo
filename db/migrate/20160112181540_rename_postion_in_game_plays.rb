class RenamePostionInGamePlays < ActiveRecord::Migration
  def change
  	rename_column :gameplays,:postion_x,:position_x
  end
end
