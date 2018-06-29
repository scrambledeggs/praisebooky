class ProfilesController < ApplicationController
  before_action :set_vote, except: [ :index, :new, :create ]

  def index
    @votes = Vote.all.order(created_at: :desc)
    @users = User.all
    
    current_user = User.find(10)
    @remaining_votes_user = 25 - current_user.votes_made.where("point > ?", 0).all.sum(:point) + current_user.votes_made.where("point < ?", 0).all.sum(:point)
    @points = current_user.votes_received.all.sum(:point) + 25
  end

end
