# frozen_string_literal: true
class MessagePolicy < ApplicationPolicy
  def index?
    admin?
  end
end
