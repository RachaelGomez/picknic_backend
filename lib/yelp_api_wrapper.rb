class YelpApiWrapper
  BASE_URL = "https://api.yelp.com/v3/businesses"
  KEY = ENV["YELP_API_KEY"]


  def self.search(query, group_id)
    url = BASE_URL + "/search"
    bearer_token = "Bearer " + KEY
    headers = {
        'Authorization': bearer_token,
        'Content-Type': "application/json"
    }

    response = HTTParty.get(url + "?&location=#{query}&term=restaurants&limit=15", headers: headers)

    if response.success?
      if response["total"] == 0
        return []
      else
        yelp_info = response["businesses"].map do |result|
          self.construct_result(result, group_id)
        end
        return yelp_info
      end
    else
      raise "Request Failed"
    end
  end

  def self.details(yelp_id)
    url = BASE_URL + '/' + yelp_id
    bearer_token = "Bearer " + KEY

    headers = {
        'Authorization': bearer_token,
        'Content-Type': "application/json"
    }

    response = HTTParty.get(url, headers: headers)

    if response.success?
        yelp_info = self.construct_details_result(response)
      return yelp_info
    else
      raise "Request Failed"
    end
  end

  private

  def self.construct_result(api_result, group_id)
    Restaurant.create(
        yelp_id: api_result["id"],
        restaurant_name: api_result["name"],
        group_id: group_id,
        rating: api_result["rating"],
        price: api_result["price"],
        image_url: api_result["image_url"],
        transactions: api_result["transactions"],
        categories: api_result["categories"],
        city: api_result["location"]["city"],
        state: api_result["location"]["state"],
        address_1: api_result["location"]["address1"],
        zipcode: api_result["location"]["zip_code"]
    )
  end

  def self.construct_details_result(api_result)
    Detail.create(
        price: api_result['price'],
        url: api_result['url'],
        phone: api_result["display_phone"],
        image_url: api_result["image_url"],
        name: api_result["name"],
        rating: api_result["rating"],
        yelp_id: api_result["id"],
        hours: api_result["hours"],
        categories: api_result["categories"],
        photos: api_result["photos"],
        address_1: api_result["location"]["address1"],
        city: api_result["location"]["city"],
        state: api_result["location"]["state"],
        zip_code: api_result["location"]["zip_code"],
        transactions: api_result["transactions"]
    )
  end
end