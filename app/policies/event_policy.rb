class EventPolicy < ApplicationPolicy
  class Scope
  end

  def index?
    true
  end
end
