class Game < ActiveRecord::Base
  validates_presence_of :position_x,:position_y,:position_offset,:status
  STATUS={1=>"Upcoming",2=>"Played",3=>"On Going"}
  validates :position_x,:position_y,:position_offset,:number_of_winner, :numericality => { :greater_than => 0}
  has_many :gameplays
  has_many :prize_redemptions
  has_many :users ,:through => :gameplays
  has_one :game_picture
  MAXIMUM_TURNS_ALLOWED=4
  scope :on_going ,->{where(:status => 3)}
  after_save :set_picture
  before_save :set_winners_count
  def winner_gameplays
     played? ? self.gameplays.order(:daviation).order(:created_at).limit(self.number_of_winner) : Gameplay.none
  end

  def upcoming?
    status==1
  end

  def played?
    status==2
  end

  def ongoing?
    status==3
  end

  def picture
    game_picture.try(:picture) || GamePicture.new.picture
  end

  def set_picture
   if !upcoming? && game_picture.nil?
      picture_to_set=GamePicture.un_used.sample(1).first
      if picture_to_set.present?
        picture_to_set.update_attributes(:is_used=>true,:game_id=>self.id)
      end
   end
  end


  def competition_picture
    game_picture.try(:competition_picture) || GamePicture.new.competition_picture
  end

  def set_winners_count
    self.number_of_winner=PingooConfiguration.number_of_winners if self.number_of_winner.to_i <=0 && PingooConfiguration.number_of_winners > 0
  end

end