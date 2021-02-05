class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
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
  end

  def show
    user_id = params[:google_id]
    @user = User.find_by(google_id: user_id)
    if @user.nil?
      render json: :bad_request
    end
  end


  private

  def user_params
    return params.require(:google_id).permit(:group_id)
  end
end
