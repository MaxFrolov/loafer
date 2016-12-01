# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  title      :string
#  default    :boolean          default(FALSE)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_groups_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_5e78cd340a  (user_id => users.id)
#

class Group < ApplicationRecord
  has_many :users_groups
  has_many :group_participants, through: :users_groups, source: :user
  belongs_to :owner, class_name: User, foreign_key: :user_id

  scope :current_user_groups, -> (user) do
    user.groups
  end
end
