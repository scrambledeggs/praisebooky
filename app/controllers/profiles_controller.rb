class ProfilesController < ApplicationController
  def index
    @profile_user = User.find(params[:id])

    redirect_to profiles_index_path(id: current_user), alert: "You can only view profiles within your department" unless @profile_user.department == current_user.department || current_user.manager

    t = Time.now
    start_date = t.at_beginning_of_month
    end_date = t.at_end_of_month

    @votes = Vote.order(created_at: :desc)

    @remaining_votes_user = 25 - @profile_user.votes_made.where(created_at: start_date..end_date).where("point > ?", 0).sum(:point) + @profile_user.votes_made.where(created_at: start_date..end_date).where("point < ?", 0).sum(:point)
    @points = @profile_user.votes_received.where(created_at: start_date..end_date).sum(:point) + 25

    @praise = @profile_user.votes_received.where(created_at: start_date..end_date).where("point > ?", 0).sum(:point)
    @criticism = -@profile_user.votes_received.where(created_at: start_date..end_date).where("point < ?", 0).sum(:point)
  end

  def me
    redirect_to profiles_index_path(id: current_user)
  end
end
