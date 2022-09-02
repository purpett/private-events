class AttendancesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @attendance = @event.attendances.build({attendee: current_user})    # attendances -> fill a line in the table attendances with a new attendance

    @attendance.save                # not checking if save works cause no validation needed
    redirect_to event_path(@event)
  end
end