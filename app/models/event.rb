class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendances, foreign_key: :attended_event_id, dependent: :destroy # when event is destroyed, it destroys all dependents, e.g. attendances
  has_many :attendees, through: :attendances

  scope :upcoming, -> { where("event_date >= ?", Date.today) }
  scope :past, -> { where("event_date < ?", Date.today) }
  scope :by_date, -> { order(event_date: :asc) }

  validates :title, :event_date, presence: true
end
