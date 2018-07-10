class ProfilesController < ApplicationController
  include Secured

  def index
    t = Time.now
    start_date = t.at_beginning_of_month
    end_date = t.at_end_of_month

    @votes = Vote.order(created_at: :desc)

    @profile_user = User.find(params[:id])

    @current_user = current_user
    
    @remaining_votes_user = 25 - @profile_user.votes_made.where(created_at: start_date..end_date).where("point > ?", 0).sum(:point) + @profile_user.votes_made.where(created_at: start_date..end_date).where("point < ?", 0).sum(:point)
    @points = @profile_user.votes_received.where(created_at: start_date..end_date).sum(:point) + 25

    @praise = @profile_user.votes_received.where(created_at: start_date..end_date).where("point > ?", 0).sum(:point)
    @criticism = -@profile_user.votes_received.where(created_at: start_date..end_date).where("point < ?", 0).sum(:point)
  end
end
