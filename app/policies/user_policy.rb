class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show_artist?
    record == user
  end

  def show_company?
    record == user
  end

  def update?
    record == user
  end

  def destroy?
    record == user
  end
end
