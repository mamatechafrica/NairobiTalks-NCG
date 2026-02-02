class AddDeviseFieldsToUsers < ActiveRecord::Migration[8.1]
  def change
    # Trackable columns
    add_column :users, :sign_in_count, :integer, default: 0, null: false
    add_column :users, :current_sign_in_at, :datetime
    add_column :users, :last_sign_in_at, :datetime
    add_column :users, :current_sign_in_ip, :string
    add_column :users, :last_sign_in_ip, :string

    # Timeoutable columns
    add_column :users, :timeout_at, :datetime

    # Remove the incorrect columns that were already added
    remove_column :users, :trackable, :boolean if column_exists?(:users, :trackable)
    remove_column :users, :timeoutable, :boolean if column_exists?(:users, :timeoutable)
  end

  private

  def column_exists?(table, column)
    ActiveRecord::Base.connection.column_exists?(table, column)
  end
end
