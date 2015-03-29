class Message < ActiveRecord::Base

  validates :recipient_user_id, presence: true
  validates :sender_user_id, presence: true
  validates :title, presence: true

  belongs_to :user, foreign_key: 'recipient_user_id'
  belongs_to :user, foreign_key: 'sender_user_id'
end