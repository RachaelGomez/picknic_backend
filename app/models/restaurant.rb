class Restaurant < ApplicationRecord
  has_many :votes
  belongs_to :group
end
