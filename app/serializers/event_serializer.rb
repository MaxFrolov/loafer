class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :subtitle, :address, :lng, :lat, :members_count, :status, :start_date, :approximate_time,
             :event_owner

  has_one :owner, serializer: UserAvatarSerializer

  def event_owner
    scope.id == object.user_id
  end
end
