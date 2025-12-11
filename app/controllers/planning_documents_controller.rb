class PlanningDocumentsController < ApplicationController
  before_action :authorize_admin!, only: [:new, :create, :destroy]

  def authorize_admin!
    redirect_to root_path, alert: "Not authorized." unless current_user&.admin?
  end
  def index
    params[:view] ||= 'grid'
    @planning_documents = PlanningDocument.all

    if params[:status].present? && params[:status] != "All"
      @planning_documents = @planning_documents.where(status: params[:status].downcase)
    end

    if params[:start_year].present?
      @planning_documents = @planning_documents.where(start_year: params[:start_year])
    end

    if params[:end_year].present?
      @planning_documents = @planning_documents.where(end_year: params[:end_year])
    end
  end

  def new
    @planning_document = PlanningDocument.new
  end

  def create
    @planning_document = PlanningDocument.new(planning_document_params)
    if @planning_document.save
      redirect_to @planning_document, notice: "Document uploaded."
    else
      render :new
    end
  end

  def show
    @planning_document = PlanningDocument.find(params[:id])
  end

  def destroy
    @document = PlanningDocument.find(params[:id])
    @document.destroy
    redirect_to planning_documents_path, notice: "Deleted successfully."
  end

  private
  def planning_document_params
    params.require(:planning_document).permit(:title, :document_type, :status, :start_year, :end_year, :file)
  end
end
