class AddTimestampColumnInDeliveryStatuses < ActiveRecord::Migration[7.0]
  def change
    add_column :delivery_statuses, :timestamp, :datetime

  end
end
