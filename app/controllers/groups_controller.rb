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

  def show_users
    group_members = Group.get_members(group_name: params[:group_name])
    if group_members.nil?
      render json: { errors: group_members.errors.messages }, status: :bad_request
    else
      render json: group_members.as_json, status: :ok
    end
  end

  private

  def group_params
    return params.permit(:host_id, :group_name, :host_name)
  end
end
