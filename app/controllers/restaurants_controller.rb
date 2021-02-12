require 'yelp_api_wrapper.rb'

KEY = ENV["YELP_API_KEY"]

class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    data = @restaurants

    render status: :ok, json: data
  end

end
