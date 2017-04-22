  class DailyInvoice < ActiveRecord::Migration[5.0]
    def change
      create_table :daily_invoices do |t|
        t.string :restaurant_name
        t.date :date
        t.integer :amount
        t.string :bill_image_path        
        t.timestamps
      end
    end
  end

