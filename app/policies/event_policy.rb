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
    create?
  end

  def update?
    create?
  end

  def destroy?
    record.owner == user
  end

  def accept_event?
    record.owner != user
  end

  def participant_events?
    create?
  end

  def permitted_attributes
    %i(title subtitle lng lat members_count status start_date approximate_time address private user_id)
  end
end
