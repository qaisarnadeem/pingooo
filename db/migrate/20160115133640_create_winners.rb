class CreateWinners < ActiveRecord::Migration
  def change
    create_table :winners do |t|
      t.references :gameplay, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
