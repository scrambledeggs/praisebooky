class VotersController < ApplicationController

  respond_to :html, :json

  def index
  end


  def new
    @vote = Vote.new
    respond_modal_with @vote
  end

  def create
    @vote = Vote.create(vote_params)
    respond_modal_with @vote, location: votes_path
  end

  private
    def set_vote
      @vote = Vote.find(params[:id])
    end

    def vote_params
      params.require(:vote).permit(:comment)
    end
  end
  


