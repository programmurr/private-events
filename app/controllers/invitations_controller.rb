class InvitationsController < ApplicationController
  def new
    @invite = Invitation.new
  end

  def create
    @invite = Invitation.new
    @invite.attendee_id = params[:invitation][:user_id]
    @invite.created_event_id = params[:invitation][:event_id]

    if @invite.save
      redirect_to root_path, notice: 'Invite sent!'
    else
      render :new
    end
  end
end
