class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :subtitle, :address, :lng, :lat, :members_count, :status, :start_date, :approximate_time

  has_one :user, serializer: UserAvatarSerializer
end
