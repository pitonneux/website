# frozen_string_literal: true
class PagesController < ApplicationController
  def home
    @featured_events = Event.featured
    @partners = Organization.all
    @message = Message.new
    @visitor = Visitor.new
  end
end
