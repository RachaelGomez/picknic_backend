class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user.as_json(only: [:id]), status: :created
    else
      render json: { errors: @user.errors.messages }, status: :bad_request
    end
  end

  def update
    @user = User.find_by(google_id: params[:google_id])
    if @user.nil?
      head :not_found
      render status: :bad_request
      return
    elsif @user.update(user_params)
      return
    end
  end

  def index
    @users = User.all
    data = User.all

    render status: :ok, json: data

  end

  def show
    user_id = params[:google_id]
    @user = User.find_by(google_id: user_id)
    if @user.nil?
      render status: :ok
    else render status: :bad_request
    end
  end


  private

  def user_params
    return params.permit(:google_id, :group_id)
  end
end
