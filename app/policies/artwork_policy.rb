class ArtworkPolicy < ApplicationPolicy
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
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
