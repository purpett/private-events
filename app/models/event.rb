class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendances, foreign_key: :attended_event_id 
  has_many :attendees, through: :attendances

  def self.upcoming
    where("event_date >= ?", Date.today)
  end

  def self.past
    where("event_date < ?", Date.today)
  end

end
