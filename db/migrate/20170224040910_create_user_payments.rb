class CreateUserPayments < ActiveRecord::Migration[5.0]
  def change
    create_table :user_payments do |t|
      t.integer :user_id
      t.float :amount_paid
      t.string :comment
      t.date :date
      t.integer :payment_mode_id

      t.timestamps
    end
  end
end
