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

class Event < ApplicationRecord
  has_many :events_participants, inverse_of: :event
  has_many :participants, through: :events_participants, class_name: User, source: :user, inverse_of: :events

  belongs_to :owner, class_name: User, foreign_key: :user_id, inverse_of: :events

  before_create :set_status_active
  before_update :check_participants_count

  validates :title, :address, :members_count, :start_date, :approximate_time, presence: true

  scope :events_active, -> { where.not(status: :full) }

  enum status: %i(active expired completed full)

  def check_is_full
    self.status = :full if self.participants.length == self.members_count
  end

  private

  def set_status_active
    self.status = :active
  end

  def check_participants_count
    errors.add(:base, 'Событие набрало нужное количество участников.') if self.participants.length - 1 >= members_count
  end
end
