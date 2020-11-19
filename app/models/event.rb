class Event < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :date, presence: true

  belongs_to :creator, class_name: 'User'
  has_many :invitations, foreign_key: :created_event_id, dependent: :destroy
  has_many :attendees, through: :invitations, source: :attendee

  scope :past, -> { where('date < ?', Time.current) }
  scope :upcoming, -> { where('date > ?', Time.current) }
end
