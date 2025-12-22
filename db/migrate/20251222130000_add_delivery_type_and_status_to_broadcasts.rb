class AddDeliveryTypeAndStatusToBroadcasts < ActiveRecord::Migration[6.1]
  def change
    add_column :broadcasts, :delivery_type, :string, null: false, default: "SMS"
    add_column :broadcasts, :status, :string, null: false, default: "Draft"
  end
end