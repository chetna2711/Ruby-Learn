class ApplicationController < ActionController::Base
  # before_action :authenticate_student!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :birthdate, :contact_no, :city, :state, :country])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :birthdate, :contact_no, :city, :state, :country])
  end
end
