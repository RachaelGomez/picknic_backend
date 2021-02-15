class Group < ApplicationRecord
  has_many :users
  has_many :restaurants
  has_many :votes, through: :users

  def self.get_members(group_name)
    group = Group.find_by(group_name: group_name)
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

  def self.get_votes(group_name)
    group_votes = []
    members = get_members(group_name)
    votes = Vote.all
    votes.each do |vote|
      members.each do |user|
        if vote.user_id == user.id
          group_votes << vote
        end
      end
    end

  end

  def self.winner(votes)
    total_votes = {}
    votes.each do |vote|
      if vote.is_right == true
        total_votes[vote.restaurant_id] = total_votes[vote.restaurant_id].nil? ? 1 : total_votes[vote.restaurant_id] + 1
      end
    end
    winner = total_votes.max_by{ |restaurant,total| total }
    return winner

  end

  def self.votes_by_restaurant(votes)
    total_votes = {}
    votes.each do |vote|
      if vote.is_right == true
        total_votes[vote.restaurant_id] = total_votes[vote.restaurant_id].nil? ? 1 : total_votes[vote.restaurant_id] + 1
      end
    end
    return total_votes
  end
  
end
