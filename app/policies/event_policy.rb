# frozen_string_literal: true
class EventPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end
end
