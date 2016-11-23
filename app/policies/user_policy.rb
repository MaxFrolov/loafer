class UserPolicy < ApplicationPolicy
  def show?
    user.present? && user == record
  end

  def update?
    user.id == record.id
  end

  def permitted_attributes
    %i(email first_name last_name phone avatar_data_uri)
  end
end
