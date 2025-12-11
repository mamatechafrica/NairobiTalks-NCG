module PlanningDocumentsHelper
  def display_year_range(doc)
    if doc.document_type == "CIDP"
      "FY #{doc.start_year} - #{doc.end_year}"
    else
      "FY #{doc.start_year}"
    end
  end
end
