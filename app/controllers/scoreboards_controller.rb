class ScoreboardsController < ApplicationController
  def index
    @users = User.select('users.id, users.first_name, (COALESCE(SUM(votes.point), 0) + 25) as vote_count').left_outer_joins(:votes_received).group('users.id, users.first_name').order("vote_count DESC")
    @monthlyrewards = MonthlyReward.all   
  end
end
