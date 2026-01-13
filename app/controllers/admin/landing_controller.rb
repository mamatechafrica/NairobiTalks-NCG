
class Admin::LandingController < Admin::BaseController
  def index
    puts "Admin landing accessed. current_user: #{current_user&.id}, admin?=#{current_user&.admin?}"
  end
end
