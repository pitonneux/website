# frozen_string_literal: true
class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @events = Event.all
    @event = Event.new
    authorize Event
  end

  def show
    @event = find_event
    authorize @event
  end

  def edit
    @event = find_event
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    authorize @event

    if @event.save
      redirect_to events_path, notice: t('.success')
    else
      redirect_to events_path, alert: t('.failure')
    end
  end

  def update
    @event = find_event
    authorize @event

    if @event.update(event_params)
      redirect_to events_path, notice: t('.success')
    else
      flash.now[:alert] = t('.failure')
      render :edit
    end
  end

  def destroy
    @event = find_event
    authorize @event

    @event.destroy
    redirect_to events_path, notice: t('.success')
  end

  private

  def find_event
    Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :starts_at, :duration_in_min, :signup_link,
                                  :featured, :cover_image_cache, :cover_image, :location_id)
  end
end
