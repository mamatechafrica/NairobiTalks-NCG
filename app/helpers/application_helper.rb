module ApplicationHelper
  def display_year_range(document)
    if document.document_type == "CIDP" && document.end_year.present?
      "#{document.start_year}-#{document.end_year}"
    else
      document.start_year
    end
  end
end
