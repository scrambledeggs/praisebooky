class ScoreboardsController < ApplicationController
  def index
    @users = User.all
    User.includes(:first_name).order("vote.point DESC")
    @monthlyrewards = MonthlyReward.all

    #User.joins(:first_name).order('votes_received.point desc')
   

  end

end




