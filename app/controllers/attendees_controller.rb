class AttendeesController < ApplicationController
  def index
    @attendees = Attendee.page(params[:page]).per(10)
  end

  def show
    @attendee = Attendee.find(params[:id])
  end
end
