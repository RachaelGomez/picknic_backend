class Group < ApplicationRecord
  has_many :users
  has_many :restaurants

  def self.get_members(group_name)
    group = Group.find_by(group_name)
    group_members = []
    users = User.all
    users.each do |user|
      if user.group_id == group.id
        group_members << user
      end
    end
    return group_members
  end

  def self.get_restaurants(group_name)
    group = Group.find_by(group_name)
    group_restaurants = []
    restaurants = Restaurant.all
    restaurants.each do |restaurant|
      if restaurant.group_id == group.id
        group_restaurants << restaurant
      end
    end
    return group_restaurants
  end
  
end
