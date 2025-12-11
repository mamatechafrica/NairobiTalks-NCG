class CreatePlanningDocuments < ActiveRecord::Migration[8.1]
  def change
    create_table :planning_documents do |t|
      t.string :title
      t.string :financial_year
      t.integer :status

      t.timestamps
    end
  end
end
