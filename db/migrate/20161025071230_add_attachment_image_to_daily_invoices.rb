  class AddAttachmentImageToDailyInvoices < ActiveRecord::Migration
    def self.up
      change_table :daily_invoices do |t|
        t.attachment :image
      end
    end
  
    def self.down
      remove_attachment :daily_invoices, :image
    end
  end
