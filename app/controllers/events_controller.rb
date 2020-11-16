class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      # @event.creator may not work - point is to redirect to the users#show of the event creator
      redirect_to @event.creator, notice: 'Event was successfully created'
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
    # Below line may not work. If it doesn't, manually build the show page for the creator
    redirect_to @event.creator
  end

  private

  def event_params
    params.require(:event).permit(:event_name, :event_date)
  end
end
