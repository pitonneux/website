# frozen_string_literal: true
class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return scope.all if user.try(:admin?)
      return scope.upcoming
    end
  end

  def index?
    true
  end

  def show?
    true
  end
end
