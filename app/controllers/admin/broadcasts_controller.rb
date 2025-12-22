class Admin::BroadcastsController < Admin::BaseController
  def index
    @broadcasts = Broadcast.all.order(created_at: :desc)
  end

  def show
    @broadcast = Broadcast.find(params[:id])
  end

  def new
    @broadcast = Broadcast.new
    @wards = Ward.all # Fetch all wards to populate the dropdown
  end

  def create
    @broadcast = Broadcast.new(broadcast_params)
    if @broadcast.save
      flash[:success] = 'Broadcast created successfully.'
      redirect_to admin_broadcasts_path
    else
      flash[:error] = 'Failed to create broadcast.'
      render :new
    end
  end

  def edit
    @broadcast = Broadcast.find(params[:id])
    @wards = Ward.all # Fetch all wards to populate the dropdown
  end

  def update
    @broadcast = Broadcast.find(params[:id])
    if @broadcast.update(broadcast_params)
      flash[:success] = 'Broadcast updated successfully.'
      redirect_to admin_broadcasts_path
    else
      flash[:error] = 'Failed to update broadcast.'
      render :edit
    end
  end

  def destroy
    @broadcast = Broadcast.find(params[:id])
    @broadcast.destroy
    flash[:success] = 'Broadcast deleted successfully.'
    redirect_to admin_broadcasts_path
  end

  private

  def broadcast_params
    params.require(:broadcast).permit(:title, :message, :ward_id, :delivery_type, :status, :image, :delivery_method)
  end
end