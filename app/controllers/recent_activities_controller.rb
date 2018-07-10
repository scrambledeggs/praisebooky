class RecentActivitiesController < ApplicationController
  include Secured
  
  def index
    @votes = Vote.order(created_at: :desc)
  end
end
