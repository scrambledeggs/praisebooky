class ScoreboardsController < ApplicationController
  include Secured
  
  def index
    @current_user = current_user
    @users_same_department = User.where(department: current_user.department).select('users.id, users.first_name, (COALESCE(SUM(votes.point), 0) + 25) as vote_sum').left_outer_joins(:votes_received).group('users.id, users.first_name').order("vote_sum DESC")
    @departments = Department.all
    @monthlyrewards = MonthlyReward.all   
  end
end
