class Detail < ApplicationRecord
  validates :yelp_id, uniqueness: true
end
