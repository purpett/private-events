class UserEventsController < ApplicationController
  before_action :authenticate_user! 

  def index
    @events = current_user.events.where("event_date >= ?", Date.today).order(event_date: :asc)
    @passed_events = current_user.events.where("event_date < ?", Date.today).order(event_date: :asc)
  end
end