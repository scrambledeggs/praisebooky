class VotesController < ApplicationController

  def index
    @votes = Vote.order(created_at: :desc)
  end


  def new
    @vote = Vote.new
  
  end

  def create
    @vote = Vote.create!(vote_params)
    @vote.user = current_user
    @vote.department = current_user.department

      if @vote.save
        redirect_to votes_index
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
