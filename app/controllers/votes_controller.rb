class VotesController < ApplicationController

  def create
    @vote = Vote.new(params[vote_params])
    data = @vote
    if @vote.save
      render json: data, status: :created
    else
      render status: :bad_request
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
