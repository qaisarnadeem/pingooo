class AddRequirdConfigurations < ActiveRecord::Migration
  def change
    PingooConfiguration.create(:configuration_id=>"NUMBER_OF_WINNERS",:value=>1)
    PingooConfiguration.create(:configuration_id=>"IS_MAJOR_BUILD",:value=>'false')
  end
end
