class AddIsActiveToGame < ActiveRecord::Migration
  def change
    add_column :games, :is_active, :boolean,:default=>true
  end
end
