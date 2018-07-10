class Auth0Controller < ApplicationController
  def callback
    # This stores all the user information that came from Auth0 and the IdP
    session[:userinfo] = request.env['omniauth.auth']

    # Redirect to the scoreboard after successful auth
    redirect_to '/scoreboards/index'
  end

  def failure
    @error_type = request.params['error_type']
    @error_msg = request.params['message']

    # Redirect to failure page after successful auth
    redirect_to '/logout/show'
  end
end
