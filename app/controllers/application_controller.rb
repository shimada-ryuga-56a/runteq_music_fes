# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  private

  def after_sign_up_path_for(_resource_or_scope)
    attendees_path
  end

  def after_update_path_for(_resource_or_scope)
    attendees_path
  end

  def after_sign_in_path_for(_resource_or_scope)
    attendees_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[
                                        username
                                        mattermost_link
                                        portfolio_link
                                        x_id
                                        is_attending
                                        term
                                        role
                                        image_url
                                      ])
  end
end
