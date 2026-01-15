class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [ :create ]

  # POST /resource
  def create
    # Build the resource with permitted params
    build_resource(sign_up_params)

    # If password not supplied (we only collect email+username), generate a secure random password
    if resource.respond_to?(:password) && resource.password.blank?
      generated = Devise.friendly_token.first(12)
      resource.password = generated
      resource.password_confirmation = generated
    end

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :signed_up_but_inactive
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  protected

  # Permit the username (and email). Passwords may be generated server-side.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :username, :email, :password, :password_confirmation ])
  end
end
