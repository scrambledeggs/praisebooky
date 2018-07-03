class ScoreboardsController < ApplicationController
  def index
    @users = User.all.order(first_name: :asc)
  end
end
