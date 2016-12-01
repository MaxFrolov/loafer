# == Schema Information
#
# Table name: users_groups
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  group_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_groups_on_group_id  (group_id)
#  index_users_groups_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_afe1a63b61  (user_id => users.id)
#

class UsersGroup < ApplicationRecord
  belongs_to :user
  belongs_to :group
end
