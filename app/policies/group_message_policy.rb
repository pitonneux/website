# frozen_string_literal: true
class GroupMessagePolicy < ApplicationPolicy
  def index?
    admin?
  end
end

