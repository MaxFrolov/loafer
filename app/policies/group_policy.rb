class GroupPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def user_groups?
    true
  end

  def destroy?
    index?
  end

  def create?
    index?
  end

  def show?
    index?
  end

  def update?
    index?
  end

  def permitted_attributes
    %i(title)
  end
end
