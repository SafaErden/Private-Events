class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :event_attendees, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendees, source: :attendee

  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :date

  scope :previous_events, -> {where("date<= ?", Date.today)}
  scope :upcoming_events, -> {where("date> ?", Date.today)}
end
