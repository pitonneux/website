class PagesController < ApplicationController
  def home
    @featured_events = Event.featured.upcoming
    @partners = Organization.all
  end
end
