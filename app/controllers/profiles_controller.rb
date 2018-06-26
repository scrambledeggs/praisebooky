class ProfilesController < ApplicationController
  before_action :set_vote, except: [ :index, :new, :create ]

  def index
    @votes = Vote.all.order(created_at: :desc)
    @users = User.all
    
    current_user = User.find(10)
    @remaining_votes_user = 25 - Vote.where(voter: current_user).where("point > ?", 0).all.sum(:point) + Vote.where(voter: current_user).where("point < ?", 0).all.sum(:point)
    @points = Vote.where(receiver: current_user).all.sum(:point) + 25
  end

end
