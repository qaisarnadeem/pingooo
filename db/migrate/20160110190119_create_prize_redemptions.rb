class CreatePrizeRedemptions < ActiveRecord::Migration
  def change
    create_table :prize_redemptions do |t|
      t.references :user
      t.references :game
      t.references :country_specific_prize
      t.integer :status
      t.timestamps null: false
    end
  end
end
