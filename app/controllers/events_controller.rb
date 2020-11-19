class EventsController < ApplicationController
  def index
    # scopes used in view
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to @event.creator, notice: 'Event was successfully created'
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
    redirect_to @event.creator
  end

  private

  def event_params
    params.require(:event).permit(:name, :date)
  end
end
