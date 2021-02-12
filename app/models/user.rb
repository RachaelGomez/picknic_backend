class User < ApplicationRecord
  belongs_to :group, optional: true
  has_many :votes
  validates :google_id, uniqueness: true
end
