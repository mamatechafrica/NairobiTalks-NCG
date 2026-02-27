class FixDeviseTrackableFields < ActiveRecord::Migration[8.1]
  def change
    # Remove incorrect boolean columns
    remove_column :users, :trackable, :boolean if column_exists?(:users, :trackable)
    remove_column :users, :timeoutable, :boolean if column_exists?(:users, :timeoutable)

    # Add proper Devise trackable columns
    add_column :users, :sign_in_count, :integer, default: 0, null: false unless column_exists?(:users, :sign_in_count)
    add_column :users, :current_sign_in_at, :datetime unless column_exists?(:users, :current_sign_in_at)
    add_column :users, :last_sign_in_at, :datetime unless column_exists?(:users, :last_sign_in_at)
    add_column :users, :current_sign_in_ip, :string unless column_exists?(:users, :current_sign_in_ip)
    add_column :users, :last_sign_in_ip, :string unless column_exists?(:users, :last_sign_in_ip)

    # Add timeoutable column
    add_column :users, :timeout_at, :datetime unless column_exists?(:users, :timeout_at)
  end

  private

  def column_exists?(table, column)
    ActiveRecord::Base.connection.column_exists?(table, column)
  end
end
