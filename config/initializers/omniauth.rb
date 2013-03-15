Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :twitter, "bqCkV4UtYLwVypUnqH8euQ", "uvN68uTlUWhHppKMvVJNrL89AI5FILUDQtviSK9Tx3c"
  provider :google, "anonymous", "anonymous"
end
