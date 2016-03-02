class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :check_for_user_2fa

  def check_for_user_2fa
    return unless current_user && current_user.unconfirmed_two_factor?
    flash[:alert] = "You did not confirmed your two factor authentication. <a href='#{confirm_two_factor_url}'>Do it here!</a>".html_safe
  end
end
