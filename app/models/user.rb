class User < ActiveRecord::Base
  devise :two_factor_authenticatable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one_time_password(encrypted: true)
end
