class AddCurrencyUinitToPrizeCategory < ActiveRecord::Migration
  def change
    add_column :prize_categories, :currency_unit, :string
  end
end
