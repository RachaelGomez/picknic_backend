class VotesController < ApplicationController

  def create
    @vote = Vote.new(vote_params)

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
