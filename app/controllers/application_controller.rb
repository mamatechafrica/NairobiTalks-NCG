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

  # Session-scope isolation (disabled): previously attempted to isolate admin vs citizen
  # sessions using `session[:admin]` which could sign users out unexpectedly.
  # Disabled by default — prefer role-based checks in `Admin::BaseController`.
  # before_action :enforce_session_scope

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def choose_layout
    if current_user&.admin? && controller_path.start_with?("admin/")
      "admin_sidebar"
    else
      "application"
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :username ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :username ])
  end

  def enforce_session_scope
    # Deprecated: keep method for reference but do not call it. If you need session
    # scoping in the future implement it explicitly and with care to avoid
    # surprising sign-outs. Example safer approach would be to set `session[:admin]`
    # only when an admin explicitly signs in via an admin-only flow.
    if session[:admin] && !request.path.start_with?("/admin")
      # legacy behavior — intentionally left commented
    elsif !session[:admin] && request.path.start_with?("/admin")
      # legacy behavior — intentionally left commented
    end
  end
end
