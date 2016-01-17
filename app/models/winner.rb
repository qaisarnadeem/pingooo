class Winner < ActiveRecord::Base
  belongs_to :gameplay
  belongs_to :game
  belongs_to :user
  validates_presence_of :gameplay
  validates_uniqueness_of :user_id,:scope=>[:game_id],:message=>" Cannot be winner multiple time for same game"
  before_save :set_game_and_user

  def set_game_and_user
    self.game=gameplay.game
    self.user=gameplay.user
  end

end
