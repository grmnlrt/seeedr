class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    record == user
  end

  def update?
    record == user
  end

  def destroy?
    record == user
  end
end
