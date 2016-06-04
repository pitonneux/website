class PagesController < ApplicationController
  def home
    @featured_events = Event.featured
    @partners = Organization.all
  end
end
