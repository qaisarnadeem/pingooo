class Gameplay < ActiveRecord::Base
  belongs_to :game
  belongs_to :user
  validates_presence_of :position_x,:position_y,:user,:game,:chance_number
  validates :chance_number ,:numericality => { :greater_than => 0,:less_than_or_equal_to=>Game::MAXIMUM_TURNS_ALLOWED}
  before_save :set_daviation
  validates :chance_number ,uniqueness: {:scope=>[:user_id,:game_id]}

  def set_daviation
    self.daviation=get_distance(position_x,position_y,game.position_x,game.position_y)  if self.valid?
  end

  def get_distance x1,y1,x2,y2
   Math.sqrt((x2-x1)**2 + (y2-y1)**2)
  end

end
