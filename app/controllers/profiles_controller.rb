class ProfilesController < ApplicationController
  before_action :set_vote, except: [ :index, :new, :create ]

  def index
    @votes = Vote.all.order(created_at: :desc)
    @users = User.all
    
    @current_user = User.find(7)
    @praise = Vote.where(receiver_id: @current_user.id).where("point > ?", 0).sum(:point)
    @criticism = -Vote.where(receiver_id: @current_user.id).where("point < ?", 0).sum(:point)
  end

end
