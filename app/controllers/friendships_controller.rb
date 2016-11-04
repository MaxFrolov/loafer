class FriendshipsController < ApiController
  expose :friendship

  def index
    render_resources current_user.all_friends
  end

  def create
    current_user.friendships.create(create_params)
  end

  def update
    friendship.update(status: :accepted)
    render_resource_or_errors friendship
  end

  def destroy
    friendship.destroy
    render nothing: true
  end

  private
  def create_params
    params.require(:resource).permit(:friend_id).merge(status: :pending)
  end
end
