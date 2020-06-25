class EventsController < ApplicationController
  before_action :set_current_user, only: [:create]

  def index
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
      params.permit(:title, :description)
    end
end

