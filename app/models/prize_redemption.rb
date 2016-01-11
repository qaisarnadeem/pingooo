class PrizeRedemption < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  belongs_to :country_specific_prize
end
