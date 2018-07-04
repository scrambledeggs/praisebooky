class ScoreboardsController < ApplicationController
  include Secured

  def index
    @users = User.order(first_name: :asc)
    @current_user = session[:userinfo]
  end
end
