class BidPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    true
  end

  def create?
    user.is_company == false
  end

  def update?
    true
  end

  def destroy?
    user.is_company
  end
end
