class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Make the first user an admin automatically
  before_create :make_first_user_admin

  # Only admin users can log in
  def active_for_authentication?
    super && admin?
  end

  def inactive_message
    admin? ? super : "You are not authorized to access this application."
  end

  private

  def make_first_user_admin
    self.admin = true if User.count.zero?
  end
end
