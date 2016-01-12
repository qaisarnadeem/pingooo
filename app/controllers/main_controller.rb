class MainController < ApplicationController
  before_filter :authorize_apps_request
  def get_all_countries
    render :json =>  {:countries=>Country.all_cached.map{|country| [{:name=>country.name,:id=>country.id,:short_code=>country.short_code}]}}
  end
end
