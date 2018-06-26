class VotesController < ApplicationController
  before_action :set_vote, except: [ :index, :new, :create ]

  def index
    @votes = Vote.all.order(created_at: :desc)
    @users = User.all

    current_user = User.find(10)
    @remaining_votes_user = 25 - current_user.votes.count
  end

  def new
    @vote = Vote.new

    current_user = User.find(10)
    @remaining_votes_user = 25 - current_user.votes.count
  end

  def create
    current_user = User.find(10)

    @vote = Vote.new(vote_params)

    @vote.user = current_user
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
