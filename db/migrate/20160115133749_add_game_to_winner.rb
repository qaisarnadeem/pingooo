class AddGameToWinner < ActiveRecord::Migration
  def change
    add_reference :winners, :game, index: true, foreign_key: true
  end
end
