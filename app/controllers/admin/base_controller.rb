
class Admin::BaseController < ApplicationController
  # Ensure Devise uses the :user mapping for admin controllers so authenticate_user! recognizes the session
  before_action :use_admin_session
  before_action :authenticate_user!
  before_action :require_admin!

  layout "admin_sidebar"

  private

  def use_admin_session
    request.env["devise.mapping"] = Devise.mappings[:user]
    session[:admin] = true
  end

  def require_admin!
    unless current_user&.admin?
      # Sign out current user and alert them to sign in as an admin account
      flash[:alert] = "Please log in as admin."
      sign_out(current_user) if current_user
      redirect_to new_admin_session_path
    end
  end
end
