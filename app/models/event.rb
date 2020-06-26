class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :event_attendees, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendees, source: :attendee
  
  scope :previous_events, -> {where(date<= Date.today)}
  scope :upcoming_events, -> {where(date> Date.today)}

  def self.previous_events
    all.previous_events
  end

  def self.upcoming_events
    all.upcoming_events
  end

end
