class PublicsController < ApplicationController
  def index
    @current_date = Time.now.strftime('%c')
  end
end
