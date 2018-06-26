Rails.application.config.middleware.use OmniAuth::Builder do
  #config = Rails.application.config.x.settings["oauth2"]

  
  #provider :google_oauth2, config["client_id"],
                           #config["client_secret"],
                          # image_size: 150

  provider :google_oauth2, '525808177862-661icl3q2jigqoketbgnhg8n9ds141r4.apps.googleusercontent.com', '0ZB_MfBTPQPMped77U7d8zvP' 

end