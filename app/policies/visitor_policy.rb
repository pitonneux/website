# frozen_string_literal: true
class VisitorPolicy < ApplicationPolicy
  def index?
    admin?
  end
end

