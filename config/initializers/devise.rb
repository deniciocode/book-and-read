Devise.setup do |config|
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'
  require 'devise/orm/active_record'

  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]

  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true

  config.password_length = 8..72

  config.reset_password_within = 6.hours

  config.sign_out_via = :delete

  # ==> OmniAuth
  # Add a new OmniAuth provider. Check the wiki for more information on setting
  # up on your models and hooks.
  config.omniauth :github,
    OAUTH_KEYS['github']['public'],
    OAUTH_KEYS['github']['secret'],
    scope: 'user,public_repo'

  config.omniauth :twitter,
    OAUTH_KEYS['twitter']['public'],
    OAUTH_KEYS['twitter']['secret']

  config.omniauth :facebook,
    OAUTH_KEYS['facebook']['public'],
    OAUTH_KEYS['facebook']['secret']

  config.omniauth :google_oauth2,
    OAUTH_KEYS['google_oauth2']['public'],
    OAUTH_KEYS['google_oauth2']['secret'], {
    scope: 'email,profile'
  }
end
