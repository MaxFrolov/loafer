class GroupsController < ApiController
  expose :group

  def index
    @groups = pundit_policy_scope(Group)
    render_resources @groups
  end

  def create
    group.assign_attributes permitted_attributes(Group)
    group.save
    render_resource_errors group
  end

  def show
    render_resource_data group
  end

  def update
    group.update permitted_attributes(Group)
    render_resource_or_errors group
  end

  def user_groups
    groups = Group.current_user_groups(current_user)
    authorize groups
    render_resources groups
  end
end
