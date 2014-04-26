class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def is_admin?
     unless current_investor && current_investor.approved && current_investor.admin
       redirect_to root_path, :notice => 'You are not authorized for this action.'
     end
  end

  private

  private
  # Overwriting the sign_out redirect path method
  def after_sign_in_path_for_user
    home_create_card_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:approved, :email, :admin, :provider, :uid, :name) }
  end

end
