class Restaurant < ApplicationRecord
  has_many :votes
  belongs_to :group
  serialize :transactions, Array
  serialize :categories, Array
end
