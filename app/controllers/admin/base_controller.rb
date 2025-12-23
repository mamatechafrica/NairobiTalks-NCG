
class Admin::BaseController < ApplicationController
  # before_action :authenticate_user!
  # before_action :require_admin!
  # before_action :use_admin_session

  layout "admin_sidebar"

  private

  def use_admin_session
    request.env["devise.mapping"] = Devise.mappings[:user]
    session[:admin] = true
  end

  def require_admin!
    unless current_user&.admin?
      reset_session # force re-login if not admin
      redirect_to new_admin_session_path, alert: "Please log in as admin."
    end
  end
end