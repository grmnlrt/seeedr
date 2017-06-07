class ExhibitionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    user.is_company == true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def new_step_one?
    user.is_company == true
  end

  def new_step_two?
    user.is_company == true
  end

  def new_step_three?
    user.is_company == true
  end

end
