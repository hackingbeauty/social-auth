# Note: This MUST BE REMOVED if you're using Devise's omniauthable, or Devise will report "invalid credentials" when attempting to log in via Twitter

Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :twitter, 'hyIvjhyW4jXOmPGWqzm4Rw', 'jf4zgAEpysq6ruqa1FXVuFJBJVvQblyJNziI1ecQTzk' # order: Consumer Key, Consumer Secret
  # option: :force_login => true will force a new login into the Provider, even though the Provider may have previously been logged in, from a different browser tab.

  provider :facebook, '202759969788474', 'db0a9dd1ad0d24a78ca30fd034cc62c8'

#   provider :linked_in, 'API Key', 'Secret Key'
end
