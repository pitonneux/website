# frozen_string_literal: true
class LocationPolicy < ApplicationPolicy
  def index?
    admin?
  end
end
