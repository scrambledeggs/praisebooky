module Secured
  extend ActiveSupport::Concern

  included do
    before_action :logged_in_using_omniauth?
  end

  def logged_in_using_omniauth?
    redirect_to '/' unless session[:userinfo].present?
  end

  def current_user
    User.find_by_email(session[:userinfo]["info"]["email"])
  end
end
