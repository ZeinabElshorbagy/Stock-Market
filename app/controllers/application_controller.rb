class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  before_action :configure_permitted_parameters, if: :devise_controller?
  respond_to :json

  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
  end

  protected
  def record_not_found(expection)
    render json: { messages: [expection.message], errors: ['not found'] },
                   status: :not_found
  end
  def authenticate_admin?
    render json: {error: 'you are not an admin'} and return unless current_user.is_admin?
  end

end
