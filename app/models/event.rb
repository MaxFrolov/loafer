# == Schema Information
#
# Table name: events
#
#  id               :integer          not null, primary key
#  title            :string
#  subtitle         :string
#  address          :string
#  lng              :float
#  lat              :float
#  members_count    :integer
#  status           :integer
#  private          :boolean          default(FALSE)
#  start_date       :datetime
#  approximate_time :datetime
#  user_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_events_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_0cb5590091  (user_id => users.id)
#

class Event < ApplicationRecord
  has_many :events_participants
  has_many :participants, through: :events_participants, class_name: User, source: :user

  belongs_to :owner, class_name: User, foreign_key: :user_id

  before_create :set_status_active

  validates :title, :address, :members_count, :start_date, :approximate_time, presence: true

  enum status: %i(active expired completed full)

  private

  def set_status_active
    self.status = :active
  end
end
