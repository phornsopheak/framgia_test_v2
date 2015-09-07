class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception
  include ApplicationHelper

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = exception.message
    current_user.admin? ? redirect_to(dashboard_path) : redirect_to(main_app.root_path)
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push :name
    devise_parameter_sanitizer.for(:sign_up).push :chatwork_id
    devise_parameter_sanitizer.for(:account_update).push :name
    devise_parameter_sanitizer.for(:account_update).push :chatwork_id
    devise_parameter_sanitizer.for(:account_update).push :chatwork_api_key
  end
end
