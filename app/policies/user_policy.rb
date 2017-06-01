class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show_artist?
    true
  end

  def show_company?
    true
  end

  def update?
    record == user
  end

  def destroy?
    record == user
  end
end
