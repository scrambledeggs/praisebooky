class ScoreboardsController < ApplicationController
  def index
    @users = User.all.order(updated_at: :desc)
#    User.joins(:votes).group("users.department_id").sum(:point)
  end

  def new
  
  end

  def create
  
  end

end

 

