  class CreateLunchDetails < ActiveRecord::Migration[5.0]
    def change
      create_table :lunch_details do |t|
        t.date :date
        t.integer :user_id 
        t.integer :daily_invoice_id
        t.boolean :had_lunch
  
        t.timestamps
      end
    end
  end
