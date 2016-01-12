class Country < ActiveRecord::Base
  ALL_COUNTRY='ALL COUNTRIES'
  validates_uniqueness_of :name,:short_code

  def dummy_all_country
    self.find_by_name(ALL_COUNTRY)
  end

  def self.all_cached
    @all_countries ||= self.all
  end

end
