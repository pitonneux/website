# frozen_string_literal: true
class OrganizationPolicy < ApplicationPolicy
  def index?
    admin?
  end
end
