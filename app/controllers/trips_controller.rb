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
    myGroup = GroupMember.where(user_id: current_user.id)
    @groups = []
    myGroup.each do |g|
      # @groups.push(Group.where(id: g.group_id))
      @groups.push(g.group.nickname)
    end
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
    params.require(:trip).permit(:nickname, :cost, :deadline, :start_date, :end_date, :group_id)
  end
end
