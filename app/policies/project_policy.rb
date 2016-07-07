# frozen_string_literal: true
class ProjectPolicy < ApplicationPolicy
  def index?
    admin?
  end
end
