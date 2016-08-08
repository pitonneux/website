# frozen_string_literal: true
class ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end
  end

  def initialize(user, record)
    @user = user
    @record = record
  end

  def show?
    admin?
  end

  def create?
    admin?
  end

  def new?
    create?
  end

  def update?
    admin?
  end

  def edit?
    update?
  end

  def destroy?
    admin?
  end

  # def scope
  #   Pundit.policy_scope!(user, record.class)
  # end
  #
  private

  def admin?
    @user.present? && @user.admin?
  end
end
