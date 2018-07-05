class ScoreboardsController < ApplicationController
  def index
    @users = User.order(first_name: :asc)
    @monthlyrewards = MonthlyReward.all
  end
end
