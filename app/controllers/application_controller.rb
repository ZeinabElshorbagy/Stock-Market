class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?

  respond_to :json

  def authenticate_admin?
    current_user.is_admin?
  end
  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
  end
end
