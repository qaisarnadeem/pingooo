class CountrySpecificPrize < ActiveRecord::Base
  belongs_to :prize_category
  belongs_to :country
end
