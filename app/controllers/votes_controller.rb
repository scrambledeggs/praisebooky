class VotesController < ApplicationController
  before_action :set_vote, except: [ :index, :new, :create ]

  def index
    t = Time.now
    start_date = t.at_beginning_of_month
    end_date = t.at_end_of_month

    @current_user = current_user

    @votes = Vote.order(created_at: :desc)
    @users = User.where(department: current_user.department).order(first_name: :asc)
    
    @remaining_votes_user = 25 - current_user.votes_made.where(created_at: start_date..end_date).where("point > ?", 0).sum(:point) + current_user.votes_made.where(created_at: start_date..end_date).where("point < ?", 0).sum(:point)
  end

  def new
    @receiver = User.find(params[:receiver])

    redirect_to votes_index_path, alert: "You can only vote within your department" unless @receiver.department == current_user.department

    t = Time.now
    start_date = t.at_beginning_of_month
    end_date = t.at_end_of_month

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
