class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def create
    group = Group.create(group_id: 'abc', )
  end
end
