class Admin::UsersController < Admin::BaseController
  def index
    @users = policy_scope(User).order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
    authorize @user
    @user_ideas = @user.community_ideas
    @user_comments = @user.comments.includes(:community_idea)
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: "User updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    authorize @user
    if @user != current_user
      @user.destroy
      redirect_to admin_users_path, notice: "User deleted successfully."
    else
      redirect_to admin_users_path, alert: "Cannot delete your own account."
    end
  end

  def toggle_admin
    @user = User.find(params[:id])
    authorize @user, :toggle_admin?
    if @user != current_user
      @user.update(admin: !@user.admin?)
      redirect_to admin_user_path(@user), notice: "User #{ @user.admin? ? 'promoted to' : 'demoted from' } admin successfully."
    else
      redirect_to admin_user_path(@user), alert: "Cannot modify your own admin status."
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :admin)
  end
end
