class VotesController < ApplicationController
  before_action :set_vote, except: [ :index, :new, :create ]

  def index
    t = Time.now
    start_date = t.at_beginning_of_month
    end_date = t.at_end_of_month

    @votes = Vote.all.order(created_at: :desc)
    @users = User.all.order(first_name: :asc)

    current_user = User.find(10)
    
    @remaining_votes_user = 25 - current_user.votes_made.where(created_at: start_date..end_date).where("point > ?", 0).all.sum(:point) + current_user.votes_made.where(created_at: start_date..end_date).where("point < ?", 0).all.sum(:point)
  end

  def new
    t = Time.now
    start_date = t.at_beginning_of_month
    end_date = t.at_end_of_month

    @vote = Vote.new

    current_user = User.find(10)

    @remaining_votes_user = 25 - current_user.votes_made.where(created_at: start_date..end_date).where("point > ?", 0).all.sum(:point) + current_user.votes_made.where(created_at: start_date..end_date).where("point < ?", 0).all.sum(:point)

    @receiver = User.find(params[:receiver])
  end

  def create
    current_user = User.find(10)

    @vote = Vote.new(vote_params)

    @vote.voter = current_user
    @vote.department = current_user.department

    if @vote.save
      redirect_to votes_path
    else
      render :new
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
