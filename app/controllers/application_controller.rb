class ApplicationController < ActionController::Base
	skip_before_action :verify_authenticity_token

	before_action :request_permissions

def request_permissions
    redirect_to "/admin" unless current_admin_user
end

end
