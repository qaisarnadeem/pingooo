class AddPrizeCategoryToPrizeRedemption < ActiveRecord::Migration
  def change
    add_reference :prize_redemptions, :prize_category, index: true, foreign_key: true
  end
end
