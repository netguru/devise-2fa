class Users::RegistrationsController < Devise::RegistrationsController
  def confirm_two_factor
    self.resource = current_user
  end

  def confirm_two_factor_update
    self.resource = current_user

    if current_user.confirm_two_factor!(params[:code])
      redirect_to root_path
    else
      flash[:alert] = 'Code is invalid!'
      render 'confirm_two_factor'
    end
  end

  protected

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

  def after_update_path_for(resource)
    return root_path unless resource.unconfirmed_two_factor?
    confirm_two_factor_path
  end
end
