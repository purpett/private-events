class UserEventsController < ApplicationController
  before_action :authenticate_user! 

  def index
    @events = current_user.events.order(event_date: :desc)
  end
end