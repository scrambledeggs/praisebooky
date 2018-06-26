class ProfilesController < ApplicationController
   before_action :set_vote, except: [ :index, :new, :create ]


  def index
    @votes = Vote.all.order(created_at: :desc)
    @users = User.all

    
    current_user = User.find(14) 
    @remain_user = 25 - current_user.votes.count 
  end


  def new
  
  end

  def create
  
  end

end
