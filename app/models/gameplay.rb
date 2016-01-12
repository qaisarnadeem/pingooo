class Gameplay < ActiveRecord::Base
  belongs_to :game
  belongs_to :user
  validates_presence_of :postion_x,:position_y,:daviation,:user,:game

  before_save :set_daviation


  def set_daviation
    self.daviation=get_distance(postion_x,position_y,game.position_x,game.position_y) if self.valid?
  end

  def get_distance x1,y1,x2,y2
   Math.sqrt((x2-x1)**2 + (y2-y1)**2)
  end

end
