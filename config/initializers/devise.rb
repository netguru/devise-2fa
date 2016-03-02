Devise.setup do |config|
  config.max_login_attempts = 3  # Maximum second factor attempts count.
  config.allowed_otp_drift_seconds = 30  # Allowed time drift between client and server.
  config.otp_length = 6  # OTP code length
  config.otp_secret_encryption_key = ENV['OTP_SECRET_ENCRYPTION_KEY']

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
end
