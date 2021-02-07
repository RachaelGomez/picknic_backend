require 'yelp_api_wrapper.rb'

KEY = ENV["YELP_API_KEY"]

class RestaurantsController < ApplicationController
  def index
    # bearer_token = "Bearer " + KEY
    # headers = {
    #     'Authorization': bearer_token,
    #     'Content-Type': "application/json"
    # }
    # response = HTTParty.get("https://api.yelp.com/v3/businesses/search?&location=Seattle&term=restaurants", headers: headers)
    #
    # render json: response
    data = YelpApiWrapper.search("seattle")
    render status: :ok, json: data
  end


end
