class TripsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: [:destroy]
  
  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
    myGroup = GroupMember.where(user_id: current_user.id)
    @groups = myGroup.map do |g|
      [g.group.nickname,g.group.id]
    end
  end

  def create
    trip = Trip.create(trip_params.merge(creator_id: current_user.id))
    flash[:success] = "Trip has been successfully created"
    redirect_to dashboard_path
  end

  def show
    @trip = Trip.find(params[:id])
    @members = []
    if @trip.group_id
      current_group = Group.find(@trip.group.id)
      current_members = GroupMember.where(group_id: current_group.id)
      current_members.each do |member|
        @members.push(User.find(member.user_id))
      end
    end
  end

  def edit
    @trip = Trip.find(params[:id])
    myGroup = GroupMember.where(user_id: current_user.id)
    @groups = myGroup.map do |g|
      [g.group.nickname,g.group.id]
    end
  end

  def update
    trip = Trip.find(params[:id])
    trip.update(trip_params)
    redirect_to dashboard_path
  end

  def destroy
    Trip.destroy(params[:id])
    render json: {status: "success", message: "Trip was successfully deleted"}
  end

  private

  def trip_params
    params.require(:trip).permit(:nickname, :cost, :deadline, :start_date, :end_date, :group_id)
  end
end
