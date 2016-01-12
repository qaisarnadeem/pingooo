class AddDummyCountryToCountry < ActiveRecord::Migration
  def change
    Country.create(:name=>Country::ALL_COUNTRY,:short_code=>Country::ALL_COUNTRY)
  end
end
