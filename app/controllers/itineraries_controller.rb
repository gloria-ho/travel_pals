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
    @itinerary = Itinerary.new
  end

  def create
    itinerary = Itinerary.create(itinerary_params)
    flash[:success] = "Itinerary has been successfully created"
    redirect_to itineraries_path
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
    params.require(:itinerary).permit(:trip_id, :city_id, :start_date, :end_date)
  end

end
