class GroupsController < ApplicationController
  def index
    @groups = Group.all
    data = Group.all

    render status: :ok, json: data
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      render json: @group.as_json(only: [:id]), status: :created
    else
      render json: { errors: @group.errors.messages }, status: :bad_request
    end
  end

  private

  def group_params
    return params.permit(:host_id, :group_name)
  end
end
