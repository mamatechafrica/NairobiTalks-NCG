class AiSummariesController < ApplicationController
  def show
    @document = PlanningDocument.find(params[:id])
    summary = OpenAiService.new.summarize_pdf(@document.file)
    render json: { summary: summary }
  end
end
