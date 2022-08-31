class UserEventsController < ApplicationController
  before_action :authenticate_user! # the before action is only for new and create, can still see if not logged in

  def index
    @events = current_user.events.order(event_date: :desc)
  end
end