# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  provider               :string           default("email"), not null
#  uid                    :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  email                  :string
#  first_name             :string
#  last_name              :string
#  phone                  :string
#  tokens                 :json
#  created_at             :datetime
#  updated_at             :datetime
#
# Indexes
#
#  index_users_on_email                 (email)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_uid_and_provider      (uid,provider) UNIQUE
#

class User < ApplicationRecord
  # Warning! Keep this order: load device modules first, then include devise token auth
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :inverse_friends, through: :inverse_friendships, source: :user

  after_create :send_welcome_email

  def full_name
    [self.first_name, self.last_name].compact.join(' ').presence || self.email
  end

  def all_friends
    friendships = Friendship.where(status: :accepted).where('user_id=? OR friend_id=?', id, id)
    user_ids = friendships.map(&:user_id)
    friend_ids = friendships.map(&:friend_id)
    ids = (user_ids + friend_ids).uniq - [id]
    User.where(id: ids)
  end

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver
  end
end
