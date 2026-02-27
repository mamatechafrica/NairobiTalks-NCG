
class Admin::BaseController < ApplicationController
  # Require a logged-in user for all admin pages
  before_action :authenticate_user!

  # Ensure the current user has the admin role
  before_action :ensure_admin!

  after_action :log_admin_action

  layout "admin_sidebar"

  private

  # Simple reusable admin check. Redirects non-admin users with a flash alert.
  def ensure_admin!
    return if current_user&.admin?

    flash[:alert] = "You must be an admin to access that section."
    redirect_to root_path
  end

  def log_admin_action
    return unless current_user&.admin?

    action_name = case request.method_symbol
    when :get then "view"
    when :post then "create"
    when :put, :patch then "update"
    when :delete then "destroy"
    else request.method_symbol.to_s
    end

    record = instance_variable_get("@#{controller_name.singularize}") if respond_to?(controller_name.singularize.to_sym)

    AdminAction.log!(
      current_user,
      "#{action_name}_#{controller_name}",
      record,
      {
        controller: controller_path,
        action: action_name,
        params: request.filtered_parameters.except(:controller, :action, :format, :authenticity_token)
      }
    )
  end
end
