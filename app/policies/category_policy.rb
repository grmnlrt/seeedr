class CategoryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new_step_one?
    user.is_company == true
  end
end
