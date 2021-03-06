class ChartsController < ApplicationController
  def new_users
    render json: User.group_by_day(:created_at).count
  end

  def trip_start
    render json: Trip.group(:trip_start_date).count
  end

  def cities
    cities = City.group(:country).count
    results = {}
    cities.keys.each do |key|
      results[key.titleize] = cities[key]
    end
    render json: results
  end

  def new_goals
    # render json: [
    #   { name: "Current".
    #     data: Goal.group(:current).count
    #   }
    # ]
    
    render json: Goal.group(:goal).count

    # render json: [
    #   {name: "Current", data: Goal.group(:current)},
    #   {name: "Goal", data: Goal.group(:goal)}
    # ]

  end
end
