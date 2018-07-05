Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    'E1AFx4xIY-fFhudQQyZI1ykhJCp3vyDV',
    'rQLgUCoBS1wytCx3fdbaMABf1USGlcnqEpAexoG741Le_XWsXKe2CBnQsQl1ox31',
    'praisebooky.auth0.com',
    callback_path: "/auth/oauth2/callback",
    authorize_params: {
      scope: 'openid email profile',
      audience: 'https://praisebooky.auth0.com/userinfo'
    }
  )
end