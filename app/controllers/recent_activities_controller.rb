class RecentActivitiesController < ApplicationController
  include Secured
  
  def index
    @current_user = current_user
    @votes_all = Vote.order(created_at: :desc)
    @votes_same_department = Vote.where(department: current_user.department).order(created_at: :desc)
  end
end
