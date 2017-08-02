class AddColumnEnableToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :enable, :boolean
    add_column :users, :pending_amount, :integer
  end
end
