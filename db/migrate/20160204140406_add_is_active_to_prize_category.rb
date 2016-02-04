class AddIsActiveToPrizeCategory < ActiveRecord::Migration
  def change
    add_column :prize_categories, :is_active, :boolean,:default => true
  end
end
