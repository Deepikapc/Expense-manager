  class AddLunchDetailIdToUser < ActiveRecord::Migration[5.0]
    def change
      add_column :users, :lunch_detail_id, :integer
      
    end
  end
