class AttendancesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @attendance = @event.attendances.build({attendee: current_user})    # attendances -> fill a line in the table attendances with a new attendance

    @attendance.save!                # not checking if save works cause no validation needed
    redirect_to event_path(@event)
  end

  def destroy 
    @event = Event.find(params[:event_id])
    @attendance = @event.attendances.find(params[:id])
    @attendance.destroy
    redirect_to event_path(@attendance.attended_event) # navigates back to event - whole point of associations (belongs_to)
  end
end