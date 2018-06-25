class VotesController < ApplicationController
    before_action :set_vote, except: [ :index, :new, :create ]


  def index
    @votes = Vote.all.order(created_at: :desc)
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
  




