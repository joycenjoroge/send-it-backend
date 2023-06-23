class CreatePaymentTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_transactions do |t|
      t.decimal :amount
      t.string :payment_status
      t.string :payment_method
      t.references :parcel_order, null: false, foreign_key: true
      

      t.timestamps
    end
  end
end
