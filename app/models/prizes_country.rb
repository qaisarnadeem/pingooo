class PrizesCountry < ActiveRecord::Base
  belongs_to :prize_category
  belongs_to :country
  delegate :amount , :to=>:prize_category ,:allow_nil=>true
end
