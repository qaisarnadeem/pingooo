class PingooConfiguration < ActiveRecord::Base
  validates_presence_of :configuration_id,:value
  validates_uniqueness_of :configuration_id,:message => "This configuration has already been set"

  def title
    configuration_id
  end


  def self.number_of_winners
    self.find_by_configuration_id('NUMBER_OF_WINNERS').value.to_i
  end

end
