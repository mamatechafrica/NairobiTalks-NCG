class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Make the first user an admin automatically - DISABLED: Allow regular citizens to sign up
  # before_create :make_first_user_admin

  # Only admin users can log in - REMOVED: Now all users can log in
  # def active_for_authentication?
  #   super && admin?
  # end

  def inactive_message
    "Your account is not active."
  end

  has_many :comments, dependent: :nullify
  has_many :community_ideas, dependent: :nullify
  has_many :votes, dependent: :destroy
  has_many :voted_community_ideas, through: :votes, source: :community_idea

  # For votes - assuming votes are stored as upvotes/downvotes on community_ideas
  # We'll handle this through a method for now
  def votes
    # This is a placeholder - votes are stored on community_ideas as upvotes/downvotes
    # In a real implementation, you'd have a Vote model
    []
  end

  # private

  # def make_first_user_admin
  #   self.admin = true if User.count.zero?
  # end
end
