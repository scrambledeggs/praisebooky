class ProfilesController < ApplicationController
  before_action :set_vote, except: [ :index, :new, :create ]

  def index
    t = Time.now
    start_date = t.at_beginning_of_month
    end_date = t.at_end_of_month

    @votes = Vote.all.order(created_at: :desc)
    @users = User.all
    
    current_user = User.find(10)
    
    @remaining_votes_user = 25 - current_user.votes_made.where(created_at: start_date..end_date).where("point > ?", 0).all.sum(:point) + current_user.votes_made.where(created_at: start_date..end_date).where("point < ?", 0).all.sum(:point)
    @points = current_user.votes_received.where(created_at: start_date..end_date).all.sum(:point) + 25
  end

end
