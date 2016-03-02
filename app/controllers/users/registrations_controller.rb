class Users::RegistrationsController < Devise::RegistrationsController
  def account_update_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation,
      :current_password,
      :two_factor_enabled,
      :phone_number
    )
  end
end
