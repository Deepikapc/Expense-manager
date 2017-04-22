  class Expense < ApplicationRecord
    # has_one :daily_invoice
    belongs_to :daily_invoice
    belongs_to :user
    validate :user_id
    acts_as_paranoid
    default_scope { where(deleted_at: nil) }
    EXPENSE_TYPES = ["MealsExpense", "FruitsExpense", "SnaksExpense"]

  end

