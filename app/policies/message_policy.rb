class MessagePolicy < ApplicationPolicy
  def index?
    admin?
  end
end
