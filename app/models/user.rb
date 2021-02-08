class User < ApplicationRecord
  belongs_to :group
  validates :google_id, uniqueness: true
end
