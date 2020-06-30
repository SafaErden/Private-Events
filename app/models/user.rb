class User < ApplicationRecord
  has_many :events, foreign_key: 'creator_id', class_name: 'Event'
  has_many :event_attendees, foreign_key: :attendee_id
  has_many :attended_events, through: :event_attendees, source: :attended_event

  validates :name, :email, presence: true
  validates :email, length: { minimum: 12 }
  validates :name, length: { minimum: 3 }


  def previous_events
    events.select{ |event| event  if event.date!=nil && event.date<= Date.today}
  end

  def upcoming_events
    events.select{ |event| event  if event.date!=nil && event.date> Date.today}
  end
end
