class MainController < ApplicationController
  before_filter :authorize_apps_request
  def get_all_countries
    render :json =>  {:total_count=>Country.all_cached.length, :countries=>Country.all_cached.map{|country| {:name=>country.name,:id=>country.id,:short_code=>country.short_code}}}
  end

  def get_prize_categories
    prize_categories=PrizeCategory.all
    prize_categories=PrizeCategory.joins(:country_specific_prizes).where(:country_specific_prizes=>{:country_id=>params[:country_id]}) if params[:country_id]
    render :json =>  {:total_count=>prize_categories.length, :prize_categories=>prize_categories.map{|p_c| {:name=>p_c.title,:id=>p_c.id}}}
  end

end
