require 'yelp_api_wrapper.rb'

KEY = ENV["YELP_API_KEY"]

class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    data = @restaurants

    render status: :ok, json: data
  end

  def restaurant_details
    # name = params[:restaurant_name].gsub(/\s+/, "")
    @restaurant = Restaurant.find_by(restaurant_name: params[:restaurant_name])
    render(
        status: :ok,
        json: @restaurant.as_json(
            only: [:id, :yelp_id, :group_id, :restaurant_name],
            )
    )
  end

  private

  def restaurant_params
    return params.permit(:yelp_id, :group_id, :restaurant_name)
  end
end