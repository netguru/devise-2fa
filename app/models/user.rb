class User < ActiveRecord::Base
  devise :two_factor_authenticatable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one_time_password(encrypted: true)

  def need_two_factor_authentication?(request)
    two_factor_enabled? && !unconfirmed_two_factor?
  end
end
