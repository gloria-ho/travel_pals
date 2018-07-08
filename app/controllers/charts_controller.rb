class ChartsController < ApplicationController
  def new_users
    render json: User.group_by_day(:created_at).count
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
