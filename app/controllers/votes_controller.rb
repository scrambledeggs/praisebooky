class VotesController < ApplicationController

  def index
    @votes = Vote.order(created_at: :desc)
  end


  def new
    @vote = Vote.new
  
  end

  def create
    current_user = User.find(10)
    receiver_user = User.find(11)

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
      params.require(:vote).permit(:comment, :point)
    end
  end
