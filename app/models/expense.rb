class Expense < ApplicationRecord
  acts_as_paranoid

  belongs_to :daily_invoice
  belongs_to :user

  validate :user_id

  default_scope {where(deleted_at: nil)}

  EXPENSE_TYPES = ["MealsExpense", "FruitsExpense", "SnaksExpense"]

end

