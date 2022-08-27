class EventsController < ApplicationController

  def index
    @events = Event.order(event_date :desc)
  end

end
