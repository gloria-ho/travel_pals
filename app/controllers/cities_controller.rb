class CitiesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: [:destroy]
  

  def new
    City.new
  end

  def create
    City.create(city_params)
  end

  private
  def city_params
    params.require(:itinerary).permit(:city, :region, :country)
  end

end
