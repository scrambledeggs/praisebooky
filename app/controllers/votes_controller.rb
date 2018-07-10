class VotesController < ApplicationController
  include Secured

  before_action :set_vote, except: [ :index, :new, :create ]

  def index
    t = Time.now
    start_date = t.at_beginning_of_month
    end_date = t.at_end_of_month

    @current_user = current_user

    @users_same_department = User.where(department: current_user.department).order(first_name: :asc)
    @remaining_votes_user = 25 - current_user.votes_made.where(created_at: start_date..end_date).where("point > ?", 0).sum(:point) + current_user.votes_made.where(created_at: start_date..end_date).where("point < ?", 0).sum(:point)
  end

  def new
    t = Time.now
    start_date = t.at_beginning_of_month
    end_date = t.at_end_of_month

    @current_user = current_user
    @receiver = User.find(params[:receiver])

    @vote = Vote.new

    @remaining_votes_user = 25 - current_user.votes_made.where(created_at: start_date..end_date).where("point > ?", 0).sum(:point) + current_user.votes_made.where(created_at: start_date..end_date).where("point < ?", 0).sum(:point)
  end

  def create
    @vote = Vote.new(vote_params)

    @vote.voter = current_user
    @vote.department = current_user.department

    if @vote.save
      redirect_to votes_path
    else
      redirect_to votes_path, alert: "Invalid vote, please ensure you chose a non-zero score, have sufficient votes, and are not voting yourself"
    end
  end

  private

  def set_vote
    @vote = Vote.find(params[:id])
  end

  def vote_params
    params.require(:vote).permit(:comment, :point, :receiver_id)
  end
end
