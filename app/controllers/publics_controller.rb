class PublicsController < ApplicationController
  def index
  	@current_date = Time.now.strftime('%F')
  end
end
