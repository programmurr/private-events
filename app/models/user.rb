class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :created_events, foreign_key: 'creator_id', class_name: 'Event'
  has_many :invitations, foreign_key: :attendee_id
  has_many :attended_events, through: :invitations, source: :created_event
end
