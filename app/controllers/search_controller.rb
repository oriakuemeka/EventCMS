# app/controllers/search_controller.rb
class SearchController < ApplicationController
  def index
    # Get the search term and selected event type from params
    search_term = params[:search]
    selected_event_type = params[:event_type]

    # Initialize empty array for search results
    @events = []

    # Filter based on the selected event type

    if selected_event_type.present? && selected_event_type != 'All'
      @events = Event.where("name LIKE ? AND event_type_id = ?", "%#{search_term}%", selected_event_type)
    else# If no specific event type is selected or 'All' is selected, search across all events
      @events = Event.where("name LIKE ?", "%#{search_term}%")
    end

    # Paginate the results
    @events = @events.page(params[:page]).per(10)
    end
  end
