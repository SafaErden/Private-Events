class EventsController < ApplicationController
  before_action :set_current_user, only: [:create]
  before_action :set_event, only: [:show]
  def index
    @events=Event.all
    @previous_events = Event.previous_events
    @upcoming_events = Event.upcoming_events
  end
  def new
  end
  def show
  end

  def create
    @event = @current_user.events.build(event_params)

    if @event.save
      flash[:notice] = 'Event saved successfully!'
      redirect_to event_path(@event)
    else
      flash[:alert] = 'There was an error. Please try again'
      redirect_to events_path
    end

  end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.permit(:title, :description, :date)
    end
end

