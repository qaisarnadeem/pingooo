class CreateCountrySpecificPrizes < ActiveRecord::Migration
  def change
    create_table :country_specific_prizes do |t|
      t.integer :amount
      t.integer :status
      t.references :prize_category, index: true, foreign_key: true
      t.references :country, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
