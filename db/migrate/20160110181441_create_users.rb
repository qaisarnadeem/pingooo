class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :email
      t.string :firstName
      t.string :lastName
      t.references :country
      t.date :date_of_birth
      t.integer :diamond_count,:default=>0
      t.string :language,:default=>"English"
      t.string :secret_code
  
      t.timestamps null: false
    end
  end
end
