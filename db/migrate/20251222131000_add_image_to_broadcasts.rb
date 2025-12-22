class AddImageToBroadcasts < ActiveRecord::Migration[6.1]
  def change
    add_column :broadcasts, :image, :string
  end
end