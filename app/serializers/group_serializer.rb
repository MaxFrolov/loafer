class GroupSerializer < ActiveModel::Serializer
  attributes :id, :title, :default

  has_many :group_participants, serializer: UserAvatarSerializer
end
