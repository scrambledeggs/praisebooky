class ProfilesController < ApplicationController
  before_action :set_vote, except: [ :index, :new, :create ]

  def index
    @votes = Vote.all.order(created_at: :desc)
    @users = User.all
    
    current_user = User.find(14) 
    @remaining_votes_user = 25 - current_user.votes.count 
  end

end
