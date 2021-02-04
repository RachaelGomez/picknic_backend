require 'yelp/fusion'
require 'dotenv'

configuration = Yelp::Fusion.client.configure do |config|
  config.api_key = ENV["YELP_API_KEY"]
end