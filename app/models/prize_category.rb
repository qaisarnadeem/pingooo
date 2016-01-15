class PrizeCategory < ActiveRecord::Base
  validates_presence_of :title,:amount
  validates :amount ,:numericality=>{:greater_than=>0}
  has_many :country_specific_prizes
  has_many :prize_redemptions
  has_attached_file :icon, styles: { medium: "300x300>"}, default_url: "/assets/:style/missing.png"
  validates_attachment_content_type :icon, content_type: /\Aimage\/.*\Z/
  after_save :set_country_specific_prizes
  has_many :prizes_countries
  has_many :countries,:through => :prizes_countries

  def set_country_specific_prizes
    country_specific_prizes.update_all(:amount=>self.amount)
  end

  def country_ids
    countries.map &:id
  end

  # def set_country_specific_prize
  #   country_specific_prizes.where('country_id not in ? ',countries).delete_all
  #   countries.each do |c_id|
  #     c_specific_p=CountrySpecificPrize.where(:country_id => c_id,:prize_category_id => self.id)
  #     c_specific_p.update_attributes(:amount=>self.amount) if c_specific_p
  #     CountrySpecificPrize.create(:country_id=>c_id,:prize_category_id=>self.id,:amount=>self.amount) unless c_specific_p
  #   end
  # end

  def set_countries_for_prizes country_ids
    if country_ids.blank?
      prizes_countries.destroy_all
      return true
    end
    prizes_countries.where('country_id not in (?)',country_ids).delete_all
    country_ids.each do |c_id|
      PrizesCountry.find_or_create_by(:prize_category_id=>self.id,:country_id=>c_id)
    end
  end

  def available_in? country_id
    self.countries.where(:prizes_countries => {:country_id=>[country_id,Country.dummy_all_country.id]}).length > 0
  end

end
