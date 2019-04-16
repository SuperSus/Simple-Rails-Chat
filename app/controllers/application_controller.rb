class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :permit_devise_parameters, if: :devise_controller?

  protected

  def permit_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :username])
  end
end
