class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    @event[:event_date] = convert_event_date_to_string(params[:event])

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
    params.require(:event).permit(:event_name, :event_date)
  end

  def convert_event_date_to_string(hash)
    %w[3 2 1].map { |e| hash["event_date(#{e}i)"].to_i }.join('-')
  end
end
