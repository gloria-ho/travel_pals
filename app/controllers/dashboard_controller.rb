class DashboardController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: [:destroy]
  
  def index
    @myTrips = []

    @myGroups = GroupMember.where(user_id: current_user.id)
    @myGroups.each do |g|
      trip = Trip.find_by(group_id: g.group_id)
      if trip.present?
        @myTrips.push(trip)
      end
    end

    trips = Trip.where(creator_id: current_user.id)
    if trips.present?
      trips.each do |t|
        unless @myTrips.include?(t)
          @myTrips.push(t)
        end
      end
    end

  end
end
