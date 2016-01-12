class Game < ActiveRecord::Base
  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  has_attached_file :competition_picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture,:competition_picture, content_type: /\Aimage\/.*\Z/
  validates_presence_of :position_x,:position_y,:position_offset,:status
  STATUS={1=>"Upcoming",2=>"Played",3=>"On Going"}
  validates :position_x,:position_y,:position_offset,:number_of_winner, :numericality => { :greater_than => 0}
  has_many :gameplays
  has_many :prize_redemptions


  def winner_gameplays
      gameplays.order(:daviation).order(:created_at).limit(self.number_of_winner)
  end

end