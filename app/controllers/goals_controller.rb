class GoalsController < ApplicationController
  respond_to :html, :json
  def new_goals
    # render json: Goal.group_by_day(:created_at).count
    # render json: Goal.where(user_id: :user_id, trip_id: :trip_id)
  end

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
    @trip = Trip.find(params[:trip_id])
    @goal = Goal.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:trip_id])
    @goal = Goal.find(params[:id])
    @goal.update(goal_params)
    repspond_with @current_trip
  end

  def destroy
  end

  private

  def goal_params
    params.require(:goal).permit(:goal, :current)
  end

end