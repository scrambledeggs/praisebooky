class ScoreboardsController < ApplicationController
  def index
    t = Time.now
    @start_date = t.at_beginning_of_month
    @end_date = t.at_end_of_month

    @users = User.all.order(updated_at: :desc)
  end
end
