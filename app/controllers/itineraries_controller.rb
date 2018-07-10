class ItinerariesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: [:destroy]
  
  def index
    @itineraries = Itinerary.all
  end

  def show
    @itinerary = Itinerary.find(params[:id])
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @trip_itinerary = Itinerary.new
    @trip_itinerary_city = City.new
  end

  def create
    city = City.find_or_create_by(city_params)
    itinerary = Itinerary.create(itinerary_params.merge(trip_id: params[:trip_id], city_id: city.id))
    flash[:success] = "Itinerary has been successfully created"
    redirect_to trip_path(params[:trip_id])
  end

  def edit
    @itinerary = Itinerary.find(params[:id])
  end

  def update
    @itinerary = Itinerary.find(params[:id])
    itinerary.update(itinerary_params)
    redirect_to itineraries_path
  end

  def destroy
    Itinerary.destroy(params[:id])
    # render json: {status: "success", message: "Itinerary was successfully deleted"}
  end

  private

  def itinerary_params
    params.require(:itinerary).permit(:start_date, :end_date)
  end

  def city_params
    params.require(:city).permit(:city, :region, :country)
  end

end
