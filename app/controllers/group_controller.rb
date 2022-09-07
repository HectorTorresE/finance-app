class GroupController < ApplicationController
  def index
    @groups = Group.where(user: current_user).order('created_at DESC')

  end

  def new
    @group = Group.new
  end

  def create
    group = Group.new(group_params)
    group.user = current_user
    if group.valid?
      group.save
      redirect_to group_index_path, notice: 'group added'
    else
      redirect_to categories_new_path, alert: group.errors.first.message, status: 400
    end
  end

  private

  def group_params
    params.require(:group).permit(:user, :name, :icon)
  end
end
