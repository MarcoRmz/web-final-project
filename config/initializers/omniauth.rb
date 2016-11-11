OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '672627040547-j2rmvkva2tcg5jr8o5hablrut7n0c37u.apps.googleusercontent.com', 'vDZfDFPC4p8FetkGRSa9p_TS'
end