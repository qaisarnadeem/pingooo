class CreateCountrySpecificPrizes < ActiveRecord::Migration
  def change
    create_table :country_specific_prizes do |t|
      t.references :prize_category
      t.references :country
      t.integer :amount
      t.integer :status

      t.timestamps null: false
    end
  end
end
