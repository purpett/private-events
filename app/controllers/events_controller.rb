class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create] # the before action is only for new and create, can still see if not logged in

  def index
    @events = Event.by_date
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)  # fills in user_id in the new post. current_user = from devise

    if @event.save
      redirect_to events_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path
  end

  private
  
  def event_params
    params.require(:event).permit(:title, :description, :location, :event_date)
  end
end
