class CountrySpecificPrize < ActiveRecord::Base
  belongs_to :prize_category
  belongs_to :country
  validates_presence_of :prize_category_id,:country_id,:amount
  validates :amount ,:numericality => {:greater_than => 0}
  validates_uniqueness_of :prize_category_id ,:scope => [:country] ,:message => " has already been added for this country. Please edit that if you want to change the prize amount"


  def self.set_and_get_country_specific_prize prize_category_id,user_id
    user=User.find(user_id)
    country_specific_prize=nil
    if user.country
        country_specific_prize=self.find_by_country_id_and_prize_category_id(user.country_id,prize_category_id)
    end
    country_specific_prize=find_or_add_all_country_prize_for(prize_category_id) unless country_specific_prize
    country_specific_prize
  end


  def self.find_or_add_all_country_prize_for prize_category_id
    prize_category=PrizeCategory.find(prize_category_id)
    c_prize_category=prize_category.country_specific_prizes.where(:country_id=>Country.dummy_all_country.id).first
    c_prize_category=CountrySpecificPrize.create(:prize_category_id=>prize_category.id,:country_id=>Country.dummy_all_country.id,:amount=>prize_category.amount) unless c_prize_category
    c_prize_category
  end

end
