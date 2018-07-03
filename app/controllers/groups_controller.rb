class GroupsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: [:destroy]
    
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    group = Group.create(group_params.merge(creator_id: current_user.id, admin_id: current_user.id))
    
    flash[:success] = "Group has been successfully created"
    redirect_to dashboard_path
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    group.update(group_params)
    redirect_to dashboard_path
  end

  def destroy
    Group.destroy(params[:id])
    # render json: {status: "success", message: "Group was successfully deleted"}
  end

  private

  def group_params
    params.require(:group).permit(:nickname, :creator_id, :admin_id)
  end

end
