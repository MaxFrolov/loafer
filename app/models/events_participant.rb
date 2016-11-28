# == Schema Information
#
# Table name: events_participants
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  event_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_events_participants_on_event_id  (event_id)
#  index_events_participants_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_40c65d1350  (user_id => users.id)
#  fk_rails_ddbf4232c8  (event_id => events.id)
#

class EventsParticipant < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates_uniqueness_of :user_id, scope: :event_id
end
