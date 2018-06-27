class ProfilesController < ApplicationController
  before_action :set_vote, except: [ :index, :new, :create ]

  def index
    @votes = Vote.all.order(created_at: :desc)
    
    @current_user = User.find(7)

    @points = Vote.where(receiver_id: @current_user.id).all.sum(:point) + 25
    @remaining_votes_user = 25 - @current_user.votes.count

    #change receiver_id to receiver
    @praise = Vote.where(receiver_id: @current_user.id).where("point > ?", 0).sum(:point)
    @criticism = -Vote.where(receiver_id: @current_user.id).where("point < ?", 0).sum(:point)
  end

end
