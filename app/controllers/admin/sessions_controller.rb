class Admin::SessionsController < Devise::SessionsController
  before_action :use_admin_session

  layout "admin_sidebar"

  # Render a simple admin-only login page
  def new
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    yield resource if block_given?
    render :new
  end

  def create
    Rails.logger.info "Admin login attempt: \\#{params[:user].inspect}"

    user_params = params.require(:user).permit(:email, :password)
    user = User.find_by(email: user_params[:email])

    if user&.valid_password?(user_params[:password]) && user.admin?
      sign_in(:user, user)
      puts "Admin signed in: \\#{current_user&.id}, admin?=\\#{current_user&.admin?}"
      puts "Session keys: \\#{session.to_hash.keys.inspect}"
      flash[:notice] = "Signed in successfully."
      redirect_to after_sign_in_path_for(user)
    else
      Rails.logger.info "Admin sign-in failed for email: \\#{user_params[:email]}"
      flash.now[:alert] = "Invalid admin credentials."
      render :new, status: :unauthorized
    end
  end

  def destroy
    super
  end

  protected

  def use_admin_session
    request.env["devise.mapping"] = Devise.mappings[:user]
  end

  def after_sign_in_path_for(resource)
    resource.admin? ? admin_root_path : super
  end
end
