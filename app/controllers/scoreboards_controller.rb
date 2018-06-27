class ScoreboardsController < ApplicationController
  def index
    @users = User.all.order(first_name: :asc)
    #User.joins(:votes).group("users.department_id").sum(:point)
  end
end
