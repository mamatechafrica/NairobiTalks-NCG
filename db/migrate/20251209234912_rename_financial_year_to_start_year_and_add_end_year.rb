class RenameFinancialYearToStartYearAndAddEndYear < ActiveRecord::Migration[8.1]
  def change
    rename_column :planning_documents, :financial_year, :start_year
    add_column :planning_documents, :end_year, :string
  end
end
