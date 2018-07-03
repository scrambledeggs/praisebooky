class RecentActivitiesController < ApplicationController
  def index
    @votes = Vote.order(created_at: :desc)
  end
end
