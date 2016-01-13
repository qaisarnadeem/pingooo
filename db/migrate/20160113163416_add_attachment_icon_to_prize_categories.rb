class AddAttachmentIconToPrizeCategories < ActiveRecord::Migration
  def self.up
    change_table :prize_categories do |t|
      t.attachment :icon
    end
  end

  def self.down
    remove_attachment :prize_categories, :icon
  end
end
