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
  
end
