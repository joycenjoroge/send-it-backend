class CreateDeliveryStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :delivery_statuses do |t|
      t.string :status
      t.references :parcel_order, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
