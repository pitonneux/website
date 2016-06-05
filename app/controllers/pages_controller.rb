class PagesController < ApplicationController
  def home
    authorize :page, :home?
    @featured_events = Event.featured
    @partners = Organization.all
  end
end
