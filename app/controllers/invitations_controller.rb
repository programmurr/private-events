class InvitationsController < ApplicationController
  def new
    @invite = Invitation.new
  end

  def create
    @invite = Invitation.new(invite_params)

    if @invite.save
      redirect_to root_path, notice: 'Invite sent!'
    else
      render :new
    end
  end

  private

  def invite_params
    params.require(:invitation).permit(:attendee_id, :created_event_id)
  end
end
