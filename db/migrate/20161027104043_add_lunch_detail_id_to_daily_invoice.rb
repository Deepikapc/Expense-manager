  class AddLunchDetailIdToDailyInvoice < ActiveRecord::Migration[5.0]
    def change
      add_column :daily_invoices, :lunch_detail_id, :integer
      
    end
  end
