class AddUserToWinner < ActiveRecord::Migration
  def change
    add_reference :winners, :user, index: true, foreign_key: true
  end
end
