class DashboardController < ApplicationController
  def index
    @myTrips = []

    @myGroups = GroupMember.where(user_id: current_user.id)
    @myGroups.each do |g|
      trip = Trip.find_by(group_id: g.group_id)
      if trip.present?
        @myTrips.push(trip)
      end
    end

    @createdTrips = []
    trips = Trip.where(creator_id: current_user.id)
    trips.each do |t|
      @createdTrips.push(t)
    end

  end
end
