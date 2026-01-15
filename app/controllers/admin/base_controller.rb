
class Admin::BaseController < ApplicationController
  # Require a logged-in user for all admin pages
  before_action :authenticate_user!

  # Ensure the current user has the admin role
  before_action :ensure_admin!

  layout "admin_sidebar"

  private

  # Simple reusable admin check. Redirects non-admin users with a flash alert.
  def ensure_admin!
    return if current_user&.admin?

    flash[:alert] = "You must be an admin to access that section."
    redirect_to root_path
  end

  # NOTE: For fine-grained authorization consider integrating Pundit or ActionPolicy here.
  # Example (commented):
  # include Pundit
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  #
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(request.referer || admin_root_path)
  # end
end
