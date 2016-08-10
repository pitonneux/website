# frozen_string_literal: true
class ContactPolicy < ApplicationPolicy
  def index?
    admin?
  end
end
