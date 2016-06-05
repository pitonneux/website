class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :authorize_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
    @event = find_event
  end

  def new
    authorize Event
    @event = Event.new
  end

  def edit
    @event = find_event
  end

  def create
    authorize Event
    @event = Event.new(event_params)

    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  def update
    @event = find_event

    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @event = find_event
    @event.destroy
    redirect_to events_url, notice: 'Event was successfully destroyed.'
  end

  private

    def set_event
      Event.find(params[:id])
    end

    def authorize_event
      authorize @event
    end

    def event_params
      params.require(:event).permit(:name, :description, :starts_at, :duration_in_min, :signup_link, :featured, :cover_image_cache, :cover_image, :location_id)
    end
end
