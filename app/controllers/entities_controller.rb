class EntitiesController < ApplicationController
  def index
    @entities = Entity.where(group: params[:group_id], user: current_user).order('created_at DESC')
    @group = Group.find(params[:group_id])
  end

  def new
    @group = Group.find(params[:group_id])
    @entity = Entity.new
  end

  def create
    @group = Group.find(params[:group_id])
    entity = Entity.new(entity_params)
    entity.user_id = current_user.id
    entity.group_id = @group.id
    if entity.valid?
      entity.save
      redirect_to group_entities_path
    else
      redirect_to new_group_entity_path, alert: entity.errors.first.message, status: 400
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end
end
