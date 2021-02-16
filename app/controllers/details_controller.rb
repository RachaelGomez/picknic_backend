class DetailsController < ApplicationController

  def create
    @detail = YelpApiWrapper.details(params[:yelp_id])
    if @detail.save
      render status: :created, json: @detail.as_json(only: [:id])
      else render json: { errors: @detail.errors.messages }, status: :bad_request
    end
  end
  def show
    @detail = Detail.find_by(yelp_id: params[:yelp_id])
    if @detail.nil?
      render status: :bad_request
    else
      render json: @detail.as_json, status: :ok
    end
  end
end
