ForestLiana.env_secret = Rails.application.secrets.forest_env_secret
ForestLiana.auth_secret = Rails.application.secrets.forest_auth_secret
Dir["#{Rails.root}/lib/*.rb"].each { |file| require file }