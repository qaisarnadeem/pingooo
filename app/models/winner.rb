class Winner < ActiveRecord::Base
  belongs_to :gameplay
  belongs_to :game
  belongs_to :user
  validates_presence_of :gameplay
  before_save :set_game_and_user

  def set_game_and_user
    self.game=gameplay.game
    self.user=gameplay.user
  end

end
