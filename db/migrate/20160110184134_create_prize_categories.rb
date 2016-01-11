class CreatePrizeCategories < ActiveRecord::Migration
  def change
    create_table :prize_categories do |t|
      t.string :title
      t.string :description
      t.integer :amount

      t.timestamps null: false
    end
  end
end
