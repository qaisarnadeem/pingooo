class Game < ActiveRecord::Base

  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/:style/missing.png",:path =>
      ":rails_root/private/system/:class/:attachment/:id/:style/:filename",
                    :url => '/:class/:attachment/:id/:style/:filename'
  has_attached_file :competition_picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/:style/missing.png",:path =>
      ":rails_root/private/system/:class/:attachment/:id/:style/:filename",
                    :url => '/:class/:attachment/:id/:style/:filename'
  validates_attachment_content_type :picture,:competition_picture, content_type: /\Aimage\/.*\Z/
 
  validates_presence_of :position_x,:position_y,:status,:picture,:competition_picture
  STATUS={1=>"Upcoming",2=>"Played",3=>"On Going"}
  UP_COMING=1
  PLAYED=2
  ON_GOING=3
  validates :position_x,:position_y,:number_of_winner, :numericality => { :greater_than => 0}
  has_many :gameplays
  has_many :prize_redemptions
  has_many :users ,:through => :gameplays
  has_one :game_picture
  MAXIMUM_TURNS_ALLOWED=4
  scope :on_going ,->{where(:status => ON_GOING)}
  scope :up_coming ,->{where(:status => UP_COMING)}
  #after_save :set_picture
  before_validation :set_status
  before_save :set_winners_count
  has_many :winners

  def set_status
    self.status=UP_COMING unless self.status
    self.number_of_winner=PingooConfiguration.number_of_winners if number_of_winner.to_i.zero?
  end

  def winner_gameplays
     played? ? self.gameplays.order(:daviation).order(:created_at).limit(self.number_of_winner) : Gameplay.none
  end

  def upcoming?
    status==1
  end

  def played?
    status==2
  end

def is_used?
 played? || ongoing?
end

  def self.get_today_game
    self.on_going.last
  end

  def self.get_next_game
    self.up_coming.where(:is_active=>true).sample(1).first
  end

  def ongoing?
    status==3
  end

  # def picture
  #   game_picture.try(:picture) || GamePicture.new.picture
  # end

  def set_picture
   if !upcoming? && game_picture.nil?
      picture_to_set=GamePicture.un_used.sample(1).first
      if picture_to_set.present?
        picture_to_set.update_attributes(:is_used=>true,:game_id=>self.id)
      end
   end
  end


  # def competition_picture
  #   game_picture.try(:competition_picture) || GamePicture.new.competition_picture
  # end

  def set_winners_count
    self.number_of_winner=PingooConfiguration.number_of_winners if self.number_of_winner.to_i <=0 && PingooConfiguration.number_of_winners > 0
  end

end