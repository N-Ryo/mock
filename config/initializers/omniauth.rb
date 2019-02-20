Rails.application.config.middleware.use OmniAuth::Builder do
    provider :slack, ENV['CLIENT_ID'], ENV['CLIENT_SECRET'], scope: "client"
    provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
    provider :twitter, "API_KEY", "API_SECRET"
end