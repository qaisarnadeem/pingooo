module ApplicationHelper
  def options_for_countries selected_country
    options_for_select(Country.all_cached.map {|c| [c.name,c.id]},selected_country)
  end

  def options_for_prize_categories selected_category
      options_for_select(PrizeCategory.all.map {|pc| [pc.title,pc.id]},selected_category)
  end

  def options_for_languages selected_language
    options_for_select([["English","English"],["Arabic","Arabic"]],selected_language)
  end

  def options_for_prize_redemptions_status selected_status
    options_for_select(PrizeRedemption::STATUS.invert.to_a,selected_status)
  end

  def options_for_games selected_game
    options_for_select(Game.all.map {|game| [game.title,game.id]},selected_game)
  end

  def options_for_users selected_user
    options_for_select(User.select(:email,:id).where("email is not null and email <>'' ").order(:email).map{|u| [u.email,u.id]},selected_user)
  end

end
