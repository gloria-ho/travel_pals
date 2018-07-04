class DashboardController < ApplicationController
  def index
    @myGroups = GroupMember.where(user_id: current_user.id)
    @myTrips = []
    @myGroups.each do |t|
      @myTrips.push(Trip.find_by(group_id: t.id))
    end
    # @MyTrips = Trip.where(group_id: @myGroups.id)
  end
end
