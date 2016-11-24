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
  belongs_to :user

  validates :title, :address, :members_count, :start_date, :approximate_time, presence: true
end
