class ProfilesController < ApplicationController
  before_action :set_vote, except: [ :index, :new, :create ]

  def index
    t = Time.now
    start_date = t.at_beginning_of_month
    end_date = t.at_end_of_month

    @votes = Vote.all.order(created_at: :desc)
    
    current_user = User.find(10)
    
    @remaining_votes_user = 25 - current_user.votes_made.where(created_at: start_date..end_date).where("point > ?", 0).sum(:point) + current_user.votes_made.where(created_at: start_date..end_date).where("point < ?", 0).sum(:point)
    @points = current_user.votes_received.where(created_at: start_date..end_date).sum(:point) + 25

    @praise = current_user.votes_received.where(created_at: start_date..end_date).where("point > ?", 0).sum(:point)
    @criticism = -current_user.votes_received.where(created_at: start_date..end_date).where("point < ?", 0).sum(:point)
  end
end
