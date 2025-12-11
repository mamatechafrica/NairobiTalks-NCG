class ApplicationController < ActionController::Base
  include Devise::Controllers::Helpers
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  layout :choose_layout

  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_root_path
    else
      root_path
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  private

  def choose_layout
    if current_user&.admin? && controller_path.start_with?('admin/')
      "admin_sidebar"
    else
      "application"
    end
  end
end
