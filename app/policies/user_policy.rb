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

  def dashboard_artist?
    user.is_company == false
  end

  def dashboard_company?
    user.is_company
  end

  def dashboard_payment?
    user.is_company
  end
end
