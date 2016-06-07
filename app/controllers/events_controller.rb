class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @events = Event.all
    @event = Event.new
    authorize @event
  end

  def show
    @event = find_event
  end

  def edit
    @event = find_event
  end

  def create
    @event = Event.new(event_params)
    authorize @event

    if @event.save
      redirect_to @event, notice: t('.success')
    else
      redirect_to events_path
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

    def find_event
      Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:name, :description, :starts_at, :duration_in_min, :signup_link, :featured, :cover_image_cache, :cover_image, :location_id)
    end
end
