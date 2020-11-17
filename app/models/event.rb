class Event < ApplicationRecord
  validates :event_name, presence: true, uniqueness: true
  validates :event_date, presence: true

  belongs_to :creator, class_name: 'User'
  has_many :invitations, foreign_key: :created_event_id, dependent: :destroy
  has_many :attendees, through: :invitations, source: :attendee

  def self.past
    all.where('event_date < ?', Time.now.strftime('%d-%m-%y')).to_a
    # This has revealed a problem
    # Dates are not sorted correctly
    # May need to change the user input date to a datetime object
    # Then re-do the events controller accordingly
    # Then use the datetime objects here to compare dates
    # Remember to check the forms
  end
end
