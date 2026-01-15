class AddSubCountyToSubmissions < ActiveRecord::Migration[8.1]
  def change
    add_column :submissions, :sub_county, :string
  end
end
