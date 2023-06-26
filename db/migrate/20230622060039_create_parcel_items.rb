class CreateParcelItems < ActiveRecord::Migration[7.0]
  def change
    create_table :parcel_items do |t|
      t.string :name
      t.integer :quantity
      t.decimal :weight
      t.decimal :value
      t.references :parcel_order, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
