class VotesController < ApplicationController

  def index
    @votes = Vote.order(created_at: :desc)
  end


  def new
    @vote = Vote.new
  
  end

  def create
    @vote = Vote.create(vote_params)
  
  end

  private
    def set_vote
      @vote = Vote.find(params[:id])
    end

    def vote_params
      params.require(:vote).permit(:comment)
    end
  end
  


