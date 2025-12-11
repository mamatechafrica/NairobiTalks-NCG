class Admin::PlanningDocumentsController < Admin::BaseController
  def index
    @planning_documents = PlanningDocument.all.order(created_at: :desc)
  end

  def new
    @planning_document = PlanningDocument.new
  end

  def create
    @planning_document = PlanningDocument.new(planning_document_params)
    if @planning_document.save
      redirect_to admin_planning_documents_path, notice: "Document uploaded successfully."
    else
      render :new
    end
  end

  def show
    @planning_document = PlanningDocument.find(params[:id])
  end

  def edit
    @planning_document = PlanningDocument.find(params[:id])
  end

  def update
    @planning_document = PlanningDocument.find(params[:id])
    if @planning_document.update(planning_document_params)
      redirect_to admin_planning_documents_path, notice: "Document updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @planning_document = PlanningDocument.find(params[:id])
    @planning_document.destroy
    redirect_to admin_planning_documents_path, notice: "Document deleted successfully."
  end

  private

  def planning_document_params
    params.require(:planning_document).permit(:title, :document_type, :status, :start_year, :end_year, :file)
  end
end
