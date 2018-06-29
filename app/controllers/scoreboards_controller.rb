class ScoreboardsController < ApplicationController
  def index
    @users = User.all.order(updated_at: :desc)
  end
end
