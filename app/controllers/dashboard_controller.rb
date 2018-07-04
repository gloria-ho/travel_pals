class DashboardController < ApplicationController
  def index
    @myGroups = GroupMember.where(user_id: current_user.id)
    @myTrips = []
    @myGroups.each do |g|
      trip = Trip.find_by(group_id: g.group_id)
      if trip.present?
        @myTrips.push(trip)
      end
    end
  end
end
