class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendances, foreign_key: :attended_event_id 
  has_many :attendees, through: :attendances

  scope :upcoming, -> { where("event_date >= ?", Date.today) }
  scope :past, -> { where("event_date < ?", Date.today) }
  scope :by_date, -> { order(event_date: :asc) }

end
