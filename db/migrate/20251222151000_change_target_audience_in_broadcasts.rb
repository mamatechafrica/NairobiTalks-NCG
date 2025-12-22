class ChangeTargetAudienceInBroadcasts < ActiveRecord::Migration[6.0]
  def change
    change_column :broadcasts, :target_audience, :string, null: true
  end
end