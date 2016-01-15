class CreatePrizesCountries < ActiveRecord::Migration
  def change
    create_table :prizes_countries do |t|
      t.references :prize_category, index: true, foreign_key: true
      t.references :country, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
