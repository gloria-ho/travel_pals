class GroupMembersController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: [:destroy]

  def new
    @group = Group.find(params[:group_id])
    @group_member = GroupMember.new
    @users = User.all.map{ |u| ["#{u.first_name} #{u.last_name}", u.id] }
  end

  def create
    @group = Group.find(params[:group_id])
    GroupMember.find_or_create_by(group_member_params.merge(group_id: @group.id))
    flash[:success] = "Group member has been successfully added"
    redirect_to @group
  end

  def show
    @group = Group.find(params[:group_id])
    redirect_to @group
  end

  def destroy
    GroupMember.destroy(params[:id])
    render json: {status: "success", message: "Group member was successfully deleted"}
  end

  private

  def group_member_params
    params.require(:group_member).permit(:user_id)
  end

end
