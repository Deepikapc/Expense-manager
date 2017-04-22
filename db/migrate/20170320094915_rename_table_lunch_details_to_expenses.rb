class RenameTableLunchDetailsToExpenses < ActiveRecord::Migration[5.0]
  def change
    rename_table :lunch_details, :expenses
  end
end
