class PrizeRedemption < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  belongs_to :prize_category
  belongs_to :country_specific_prize
  validates_presence_of :user_id,:game_id,:country_specific_prize_id,:prize_category_id
  STATUS={1=>"NEW",2=>"PAID"}
  before_validation :set_country_specific_prize
  validates_uniqueness_of :user_id , :scope => [:game_id] ,:message => " has already requested Prize Redemption"
  validate :winner_check_and_other_rules
  def set_country_specific_prize
      if user_id && prize_category_id
         self.country_specific_prize_id=CountrySpecificPrize.set_and_get_country_specific_prize(prize_category_id,user_id).id
      end
  end

  def winner_check_and_other_rules
    return false if game.blank? || user.blank?
    unless game.played?
      errors.add(:game, " is not played yet")
      return false
    end

    unless game.winner_gameplays.map(&:user_id).include? user_id
      errors.add(:user, " is not a winner for this game so you cannot redeem prize")
      return false;
    end

  end

end
