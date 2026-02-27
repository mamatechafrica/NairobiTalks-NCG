class TwoFactorAuthenticationsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin!

  def show
    if current_user.otp_secret.blank?
      current_user.generate_otp_secret!
      current_user.save!
    end

    @qr_code = RQRCode::QRCode.new(current_user.otp_provisioning_uri("NairobiTalks-#{current_user.email}", issuer: "NairobiTalks"))
  end

  def create
    if current_user.validate_and_consume_otp!(params[:otp_attempt])
      current_user.otp_required_for_login = true
      current_user.save!
      redirect_to profile_path, notice: "Two-factor authentication enabled successfully."
    else
      flash[:alert] = "Invalid verification code. Please try again."
      render :show
    end
  end

  def destroy
    current_user.otp_required_for_login = false
    current_user.save!
    redirect_to profile_path, notice: "Two-factor authentication disabled."
  end

  private

  def require_admin!
    redirect_to root_path, alert: "Access denied." unless current_user&.admin?
  end
end
