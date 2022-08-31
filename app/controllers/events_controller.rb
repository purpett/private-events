class EventsController < ApplicationController

  def index
    @events = Event.order(event_date: :desc)
  end

  def show
    @events
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to events_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  
  def event_params
    params.require(:event).permit(:title, :description, :location, :event_date)
  end
end
