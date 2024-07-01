class AttendeesController < ApplicationController
  def index
    @attendees = Attendee.all
  end

  def show
    @attendee = Attendee.find(params[:id])
  end
end
