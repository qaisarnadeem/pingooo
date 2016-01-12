module ApplicationHelper
  def options_for_countries selected_country
    options_for_select(Country.all_cached.map {|c| [c.name,c.id]},selected_country)
  end
end
