class CreatePrizeRedemptions < ActiveRecord::Migration
  def change
    create_table :prize_redemptions do |t|
      t.references :user, index: true, foreign_key: true
      t.references :game, index: true, foreign_key: true
      t.references :country_specific_prize, index: true, foreign_key: true
      t.integer :status

      t.timestamps null: false
    end
  end
end
