class VotesController < ApplicationController

  def create
    @user = User.find_by(google_id: params[:user_id])
    @vote = Vote.new(user_id: @user.id, restaurant_id: params[:restaurant_id], is_right: params[:is_right])

    if @vote.save
      render json: @vote.as_json(only: [:id]), status: :created
    else
      render json: { errors: @vote.errors.messages }, status: :bad_request
    end
  end

  def index
    @votes = Vote.all
    data = @votes

    render json: data, status: :ok

  end


  private

  def vote_params
    return params.permit(:user_id, :restaurant_id, :is_right)
  end
end
