class UserPolicy < ApplicationPolicy
  class Scope < Scope
 def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def edit?
    record == user
  end

  def update?
    edit?
  end
end
