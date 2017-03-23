class RemoveLunchDetailFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :lunch_detail_id
  end
end
