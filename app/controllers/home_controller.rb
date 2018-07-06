class HomeController < ApplicationController
  def show
    redirect_to '/scoreboards/index' if session[:userinfo].present?
  end
end
