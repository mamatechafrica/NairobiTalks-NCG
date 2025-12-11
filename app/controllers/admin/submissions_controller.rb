class Admin::SubmissionsController < Admin::BaseController
  before_action :set_citizen_submission, only: %i[update_status update_comment toggle_flag]

  def index
    @view_mode = params[:view].in?(%w[grid table]) ? params[:view] : "table"
    @filter = params[:filter]
    @submissions = CitizenSubmission.order(flagged: :desc, created_at: :desc)
    
    # Apply filters
    case @filter
    when "flagged"
      @filtered_submissions = @submissions.where(flagged: true)
    when "approved"
      @filtered_submissions = @submissions.where(status: "approved")
    when "rejected"
      @filtered_submissions = @submissions.where(status: "rejected")
    when "under_review"
      @filtered_submissions = @submissions.where(status: "under_review")
    when "submitted"
      @filtered_submissions = @submissions.where(status: "submitted")
    else
      @filtered_submissions = @submissions
    end
  end

  def update_status
    if @submission.update(status: status_param)
      flash[:notice] = "Submission status updated."
    else
      flash[:alert] = "Unable to update status."
    end
    redirect_back fallback_location: admin_submissions_path(view: params[:view])
  end

  def update_comment
    if @submission.update(admin_comment: admin_comment_param)
      flash[:notice] = "Saved admin note."
    else
      flash[:alert] = "Unable to save your comment."
    end
    redirect_back fallback_location: admin_submissions_path(view: params[:view])
  end

  def toggle_flag
    @submission.update(flagged: !@submission.flagged)
    notice = @submission.flagged ? "Submission flagged for follow-up." : "Flag cleared."
    redirect_back fallback_location: admin_submissions_path(view: params[:view]), notice: notice
  end

  def bulk_update
    submission_ids = params[:submission_ids] || []
    updates = {}
    updates[:status] = params[:status] if params[:status].present?
    updates[:admin_comment] = params[:admin_comment] if params[:admin_comment].present?

    if submission_ids.any? && updates.any?
      updated_count = CitizenSubmission.where(id: submission_ids).update_all(updates)
      flash[:notice] = "Updated #{updated_count} submission#{updated_count == 1 ? '' : 's'}."
    else
      flash[:alert] = "No submissions selected or no updates specified."
    end

    redirect_back fallback_location: admin_submissions_path(view: params[:view])
  end

  private

  def set_citizen_submission
    @submission = CitizenSubmission.find(params[:id])
  end

  def status_param
    params.require(:citizen_submission).permit(:status)[:status]
  end

  def admin_comment_param
    params.require(:citizen_submission).permit(:admin_comment)[:admin_comment]
  end
end
