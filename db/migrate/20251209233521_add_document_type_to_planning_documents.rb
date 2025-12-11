class AddDocumentTypeToPlanningDocuments < ActiveRecord::Migration[8.1]
  def change
    add_column :planning_documents, :document_type, :string
  end
end
