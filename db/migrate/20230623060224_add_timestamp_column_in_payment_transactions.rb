class AddTimestampColumnInPaymentTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :payment_transactions, :timestamp, :datetime
  end
end
