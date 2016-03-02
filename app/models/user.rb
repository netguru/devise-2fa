class User < ActiveRecord::Base
  before_save :valid_two_factor_confirmation

  devise :two_factor_authenticatable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one_time_password(encrypted: true)

  def send_two_factor_authentication_code
    return unless phone_number.present?
    Twilio::REST::Client.new.messages.create(
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: phone_number,
      body: "Code is #{otp_code}"
    )
  end

  def need_two_factor_authentication?(request)
    two_factor_enabled? && !unconfirmed_two_factor?
  end

  def confirm_two_factor!(code)
    update_attributes(unconfirmed_two_factor: false) if authenticate_otp(code)
  end

  private

  def valid_two_factor_confirmation
    return true unless two_factor_just_set || phone_changed_with_two_factor
    self.unconfirmed_two_factor = true
  end

  def two_factor_just_set
    two_factor_enabled? && two_factor_enabled_changed?
  end

  def phone_changed_with_two_factor
    two_factor_enabled? && phone_number_changed?
  end
end
