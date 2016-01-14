class AddAdminUser < ActiveRecord::Migration
  def change
    AdminUser.create(:email=>"admin@custompingooo.com",:password=>'admin123456789')
  end
end
