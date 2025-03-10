class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  private

  def after_sign_up_path_for(resource_or_scope)
    attendees_path
  end

  def after_update_path_for(resource_or_scope)
    attendees_path
  end

  def after_sign_in_path_for(resource_or_scope)
    attendees_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :mattermost_link, :portfolio_link, :x_id, :attend?, :term, :role])
  end
end
