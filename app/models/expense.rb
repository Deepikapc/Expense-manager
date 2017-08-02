class Expense < ApplicationRecord
  acts_as_paranoid

  belongs_to :daily_invoice
  belongs_to :user

  validate :user_id

  default_scope {where(deleted_at: nil)}

  TYPES = ["MealsExpense", "FruitsExpense", "SnaksExpense"]

  #
  # import_data
  #
  # params {FILE} file
  def self.import_data(file, type = "MealsExpense", user_suffix = '_u', company_suffix = '_c')
    begin
      CSV.foreach(file.path, headers: true).with_index do |row, index|
        row.each do |header,value|
          if index == 0
            if header.present? && header.include?(user_suffix)
              user_name = header.split('_u').first
              user = User.find_or_create_by(name: user_name, cost_of_meal: value)
              user.save(validate:false)
            end
          else
            if row["Date"] == 'Total pending amount'
              if header.present? && header.include?(user_suffix)
                user_name = header.split('_u').first
                user = User.find_or_create_by(name: user_name, pending_amount: value)
                user.save(validate:false)
              end
            else
              date = Date.parse(row["Date"]) rescue next
              amount = row["Cost of Meal"]
              daily_invoice = DailyInvoice.find_or_create_by(restaurant_name: "Imported Data", date: date, amount: amount)
              daily_invoice.save(validate: false)
              if header.present? && header.include?(user_suffix)
                user_name = header.split('_u').first
                user = User.find_by_name(user_name)
                had_lunch = value.present?? value : 0
                meal_expense = Expense.find_or_create_by(date: date,had_lunch: had_lunch, user_id: user.id, type: type, daily_invoice_id: daily_invoice.id)
                meal_expense.save(validate: false)
              end
            end
          end
        end

      end
      return {status: 'success'}
    rescue
      return {status: 'failure'}
    end
  end

end

