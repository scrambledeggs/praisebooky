class RecentActivitiesController < ApplicationController
  def index
  	current_user = User.find(1)
    @votes = Vote.where(department: current_user.department).order(created_at: :desc)
  end
end
