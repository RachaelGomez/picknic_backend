class GroupsController < ApplicationController
  def index
    @groups = Group.all
    data = Group.all

    render status: :ok, json: data
  end

  def create
    @group = Group.create(group_params)

    group_id = @group.id

    @restaurants = YelpApiWrapper.search('seattle', group_id)

    if @group.save
      response = { :group => @group, :restaurants => @restaurants }
      respond_to do |format|
        format.json { render :json => response}
      end
    else
      render json: { errors: @group.errors.messages }, status: :bad_request
    end
  end

  def show
    @group = Group.find_by(group_name: params[:id])
    render(
        status: :ok,
        json: @group.as_json(
            only: [:id, :host_id, :group_name, :host_name, :is_started],
            )
    )
  end

  def update
    @group = Group.find_by(group_name: params[:group_name])
    @group.is_started = true
    if @group.nil?
      render status: :not_found
    else @group.update!(is_started: @group.is_started)
      render json: @group.as_json, status: :ok
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

  def show_restaurants
    group_restaurants = Group.get_restaurants(group_name: params[:group_name])
    if group_restaurants.nil?
      render json: { errors: group_restaurants.errors.messages }, status: :bad_request
    else
      render json: group_restaurants.as_json, status: :ok
    end
  end

  private

  def group_params
    return params.permit(:host_id, :group_name, :host_name, :is_started)
  end
end