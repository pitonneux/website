class LocationsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_and_authorize_location, only: [:show, :edit, :update, :destroy]

  def index
    @locations = Location.all
    @location = Location.new
    authorize Location
  end

  def show
  end

  def edit
  end

  def create
    @location = Location.new(location_params)
    authorize @location

    if @location.save
      redirect_to locations_path, notice: t('.success')
    else
      redirect_to locations_path, alert: t('.failure')
    end
  end

  def update
    if @location.update(location_params)
      redirect_to locations_path, notice: t('.success')
    else
      flash.now[:alert] = t('.failure')
      render :edit
    end
  end

  def destroy
    @location.destroy
    redirect_to locations_url, notice: t('.success')
  end

  private
    def find_and_authorize_location
      @location = Location.find(params[:id])
      authorize @location
    end

    def location_params
      params.require(:location).permit(:name, :address, :directions, :organization_id)
    end
end
