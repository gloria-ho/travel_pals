class GoalsController < ApplicationController

  def new
    @trip = Trip.find(params[:trip_id])
    @goal = Goal.new
  end

  def create
    @current_trip = Trip.find(params[:trip_id])
    Goal.create(goal_params.merge(user_id: current_user.id, trip_id: @current_trip.id, deadline: @current_trip.deadline))
    redirect_to @current_trip
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def goal_params
    params.require(:goal).permit(:goal, :current)
  end

end