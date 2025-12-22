class AddDeliveryMethodToBroadcasts < ActiveRecord::Migration[6.0]
  def change
    add_column :broadcasts, :delivery_method, :string, default: "in_app"
  end
end