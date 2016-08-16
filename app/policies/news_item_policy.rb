# frozen_string_literal: true
class NewsItemPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end
end
