class CreatePingooConfigurations < ActiveRecord::Migration
  def change
    create_table :pingoo_configurations do |t|
      t.string :configuration_id
      t.string :value

      t.timestamps null: false
    end
  end
end
