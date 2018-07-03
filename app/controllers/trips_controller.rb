class TripsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: [:destroy]
  
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
  end

  def create
    trip = Trip.create(trip_params.merge(creator_id: current_user.id))
    flash[:success] = "Trip has been successfully created"
    redirect_to dashboard_path
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    trip.update(trip_params)
    redirect_to dashboard_path
  end

  def destroy
    Trip.destroy(params[:id])
    # render json: {status: "success", message: "Itinerary was successfully deleted"}
  end

  private

  def trip_params
    params.require(:trip).permit(:nickname, :creator_id, :cost, :deadline, :start_date, :end_date)
  end
end
