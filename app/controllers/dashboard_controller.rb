class DashboardController < ApplicationController
  def index
    @groups = Group.all
    @myGroups = GroupMember.where(user_id: current_user.id)
  end
end
