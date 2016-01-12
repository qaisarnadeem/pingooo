class AddDaviationToGameplays < ActiveRecord::Migration
  def change
    add_column :gameplays, :daviation, :float
  end
end
