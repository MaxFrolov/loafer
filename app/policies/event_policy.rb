class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def create?
    true
  end

  def show?
    record.user == user
  end

  def update?
    show?
  end

  def destroy?
    show?
  end

  def permitted_attributes
    [:title, :subtitle, :lng, :lat, :members_count, :status, :start_date, :approximate_time, :address, :private]
  end
end
