class AddCoulmnTypeToExpenses < ActiveRecord::Migration[5.0]
  def change
    add_column :expenses, :type, :string
  end
end
