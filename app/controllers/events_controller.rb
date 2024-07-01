class EventsController < ApplicationController
  def index
    @events = Event.page(params[:page]).per(10) 
  end

  def show
    @event = Event.find(params[:id])
  end
end
