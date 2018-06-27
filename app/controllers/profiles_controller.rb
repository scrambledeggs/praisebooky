class ProfilesController < ApplicationController
  before_action :set_vote, except: [ :index, :new, :create ]

  t = Time.now
  @@start_date = t.at_beginning_of_month
  @@end_date = t.at_end_of_month

  def index
    @votes = Vote.all.order(created_at: :desc)
    @users = User.all
    
    current_user = User.find(10)

    @remaining_votes_user = 25 - current_user.votes.where(created_at: @@start_date..@@end_date).count
    @points = Vote.where(receiver_id: current_user.id).where(created_at: @@start_date..@@end_date).all.sum(:point) + 25
  end

end
