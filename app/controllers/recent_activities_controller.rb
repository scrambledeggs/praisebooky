class RecentActivitiesController < ApplicationController
  def index
    @votes = Vote.all.order(created_at: :desc)
  end
end
