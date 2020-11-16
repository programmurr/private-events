class Event < ApplicationRecord
  validates :event_name, presence: true, uniqueness: true
  validates :event_date, presence: true
  belongs_to :creator, class_name: 'User'
end
