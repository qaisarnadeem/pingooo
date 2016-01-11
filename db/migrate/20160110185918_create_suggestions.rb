class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.references :user
      t.string :subject
      t.text :description

      t.timestamps null: false
    end
  end
end
