class CreateParcelOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :parcel_orders do |t|
      t.string :destination
      t.string :status
      t.string :present_location
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
