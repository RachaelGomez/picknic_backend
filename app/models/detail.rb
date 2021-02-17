class Detail < ApplicationRecord
  validates :yelp_id, uniqueness: true
  serialize :hours, Array
  serialize :location, Array
  serialize :categories, Array
  serialize :photos, Array
  serialize :transactions, Array
end
