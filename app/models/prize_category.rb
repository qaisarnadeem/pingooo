class PrizeCategory < ActiveRecord::Base
  validates_presence_of :title,:amount
  validates :amount ,:numericality=>{:greater_than=>0}
  has_many :country_specific_prizes


end
