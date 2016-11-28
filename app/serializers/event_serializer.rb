class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :subtitle, :address, :lng, :lat, :members_count, :status, :start_date, :approximate_time,
             :event_owner, :event_participant, :participants_count

  has_one :owner, serializer: UserAvatarSerializer
  has_many :participants, serializer: UserSerializer

  def event_owner
    scope.id == object.user_id
  end

  def event_participant
    object.participants.find_by(id: scope.id).present?
  end

  def participants_count
    object.participants.length
  end
end
