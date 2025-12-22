class SubmissionsController < ApplicationController
  def new
    @submission = Submission.new
    @community_ideas = CommunityIdea.order(upvotes: :desc).limit(20)
  end

  def create
    @submission = Submission.new(submission_params)

    if @submission.save
      CommunityIdea.create!(
        title: @submission.title,
        description: @submission.description,
        ward: @submission.location,
        topic: @submission.topic == 'Other' ? @submission.other_topic : @submission.topic,
        upvotes: 0,
        downvotes: 0,
        status: "pending"
      )

      redirect_to root_path, notice: "Thank you! Your idea is now live for community voting."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @submission = Submission.new
    @community_ideas = CommunityIdea.order(upvotes: :desc).limit(20)
    render :new
  end

  private

  def submission_params
    params.require(:submission).permit(:title, :description, :location, :topic, :anonymity, :citizen_contact, :other_topic)
  end

  def save_to_google_sheet(submission)
    begin
      session = GoogleDrive::Session.from_service_account_key(ENV['GOOGLE_SERVICE_ACCOUNT_JSON_PATH'])
      spreadsheet = session.spreadsheet_by_title("Timiza")
      return false if spreadsheet.nil?
      sheet = spreadsheet.worksheet_by_title("Submissions")
      return false if sheet.nil?
      sheet.insert_rows(sheet.num_rows + 1, [[
        Time.now.to_s,
        submission.title,
        submission.description,
        submission.location,
        submission.topic,
        submission.other_topic,
        submission.anonymity,
        submission.citizen_contact
      ]])
      sheet.save
      true
    rescue => e
      Rails.logger.error "Error saving to Google Sheets: #{e.message}"
      false
    end
  end
end