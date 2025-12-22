class Admin::LandingController < Admin::BaseController
  skip_before_action :authenticate_user!, only: [:index]
  skip_before_action :require_admin!, only: [:index]

  def index
    # This is a public landing page for admins
  end
end