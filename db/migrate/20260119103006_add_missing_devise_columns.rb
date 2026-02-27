class AddMissingDeviseColumns < ActiveRecord::Migration[8.1]
  def change
    # Add proper Devise trackable columns if they don't exist
    add_column :users, :sign_in_count, :integer, default: 0, null: false
    add_column :users, :current_sign_in_at, :datetime
    add_column :users, :last_sign_in_at, :datetime
    add_column :users, :current_sign_in_ip, :string
    add_column :users, :last_sign_in_ip, :string
    add_column :users, :timeout_at, :datetime
  end
end
