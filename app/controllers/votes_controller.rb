class VotesController < ApplicationController

  def index
    @votes = Vote.order(created_at: :desc)
    @users = User.order(created_at: :desc)

    current_user = User.find(10)
    @remain_user = 25 - current_user.votes.count
  end

  def new
    @vote = Vote.new
  
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
