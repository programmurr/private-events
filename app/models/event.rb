class Event < ApplicationRecord
  validates :event_name, presence: true, uniqueness: true
  validates :event_date, presence: true

  belongs_to :creator, class_name: 'User'
  has_many :invitations, foreign_key: :created_event_id
  has_many :attendees, through: :invitations, source: :attendee
end
