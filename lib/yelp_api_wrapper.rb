class YelpApiWrapper
  BASE_URL = "https://api.yelp.com/v3/businesses"
  KEY = ENV["YELP_API_KEY"]

#   def self.search
#     # url = BASE_URL + "/search"
#     # bearer_token = "Bearer " + KEY
#     # headers = {
#     #     'Authorization': bearer_token,
#     #     'Content-Type': "application/json"
#     # }
#     #
#     # response = HTTParty.get(url + query, headers: headers)
#     #
#     # if response.success?
#     #   if response["total"] == 0
#     #     return []
#     #   else
#     #     yelp_info = response["businesses"].map do |result|
#     #       self.construct_result(result)
#     #     end
#     #     return yelp_info
#     #   end
#     # else
#     #   raise "Request Failed"
#     # end
#     bearer_token = "Bearer " + KEY
#     headers = {
#         'Authorization': bearer_token,
#         'Content-Type': "application/json"
#     }
#     response = HTTParty.get("https://api.yelp.com/v3/businesses/search?&location=Seattle&term=restaurants", headers: headers)
#
#     render json: response
#     # search_params = {
#     #     location: 'Seattle',
#     #     term: 'restaurants'
#     # }
#   end
#
#   private
#
#   def self.construct_result(api_result)
#     Restaurant.new(
#         yelp_id: api_result["id"]
#     )
#   end
# end