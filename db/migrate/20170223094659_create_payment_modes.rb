class CreatePaymentModes < ActiveRecord::Migration[5.0]
  def change
    create_table :payment_modes do |t|
      t.string :payment_gateway
      t.timestamps
    end
  end
end
