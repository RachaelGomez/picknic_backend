class User < ApplicationRecord
  belongs_to :group, optional: true
  validates :google_id, uniqueness: true
end
