class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :email
      t.string :first_name
      t.string :last_name
      t.references :country, index: true, foreign_key: true
      t.date :date_of_birth
      t.integer :diamond_count,:default=>true
      t.string :language,:default=>"English"
      t.string :secret_code

      t.timestamps null: false
    end
  end
end
