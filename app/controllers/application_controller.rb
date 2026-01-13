class ApplicationController < ActionController::Base
    include CableReady::Broadcaster
  include Devise::Controllers::Helpers
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  layout :choose_layout

  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_dashboard_path
    else
      profile_path
    end
  end

  def after_sign_up_path_for(resource)
    profile_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  # Ensure admin and citizen sessions are isolated
  before_action :enforce_session_scope

  # Handle invalid CSRF token gracefully by resetting session and redirecting to sign-in
  rescue_from ActionController::InvalidAuthenticityToken, with: :handle_invalid_auth_token

  private

  def handle_invalid_auth_token
    Rails.logger.warn "InvalidAuthenticityToken: resetting session for request=#{request.method} #{request.fullpath} ip=#{request.remote_ip}"
    reset_session
    redirect_to new_user_session_path, alert: "Your session has expired. Please sign in again."
  end

  def choose_layout
    if current_user&.admin? && controller_path.start_with?("admin/")
      "admin_sidebar"
    else
      "application"
    end
  end

  def enforce_session_scope
    if session[:admin] && !request.path.start_with?("/admin")
      # If admin session, but accessing citizen side, force logout
      sign_out(current_user)
      session.delete(:admin)
    elsif !session[:admin] && request.path.start_with?("/admin")
      # If citizen session, but accessing admin, force logout unless the current user is an admin (e.g., logged-in via Warden in tests)
      sign_out(current_user) unless current_user&.admin?
    end
  end
end
