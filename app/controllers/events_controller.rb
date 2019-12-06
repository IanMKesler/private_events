class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @user = current_user
    @event = @user.created_events.build(event_params)
    if @event.save
      flash[:success] = "Event Created"
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
  end

  private
    def event_params
      params.require(:event).permit(:title, :description, :location, :date)
    end
end
