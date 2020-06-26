class InvitesController < ApplicationController
  before_action :set_current_user
  before_action :authenticate_user

  def index
    @users=User.all 
    @events=@current_user.events
  end

  def create
    @invitation = EventAttendee.new
    @invitation.attendee_id=params[:user_id] 
    @invitation.attended_event_id=params[:event_id] 

    if @invitation.save
      flash[:notice] = 'Invitaion completed successfully'
      redirect_to events_path
    else
      flash[:alert] = 'There was an error. Please try again'
      redirect_to invites_path
    end

  end

    private

    def invite_params
      params.permit(:event_id, :user_id)
    end
end
